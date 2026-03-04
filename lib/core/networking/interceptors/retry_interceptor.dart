import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart';
import '../models/retry_config.dart';

class RetryInterceptor extends Interceptor {
  static const retryEnabledKey = 'retry_enabled';
  static const retryErrorConditionsKey = 'retry_error_conditions'; // List<int>

  RetryInterceptor({
    required this.dio,
    required this.retryConfig,
  });

  final Dio dio;
  final RetryConfig retryConfig;

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    try {
      final requestOptions = err.requestOptions;
      final currentCount = requestOptions.retryCount + 1;

      if (!requestOptions.isRetryEnabled(retryEnabledKey) ||
          !_shouldRetry(err, currentCount)) {
        return handler.next(err);
      }

      // Update retry count on options (persisted in extra)
      requestOptions.retryCount = currentCount;

      // If request was canceled, bail out
      if (requestOptions.cancelToken != null && requestOptions.cancelToken!.isCancelled) {
        return handler.next(err);
      }

      final delay = _calculateDelay(currentCount);

      if (delay != Duration.zero) {
        await Future.delayed(delay);
      }

      // Again check cancellation before firing
      if (requestOptions.cancelToken != null && requestOptions.cancelToken!.isCancelled) {
        return handler.next(err);
      }

      // Re-create options to avoid mutating original too much; preserve most-used fields
      final options = Options(
        method: requestOptions.method,
        headers: Map<String, dynamic>.from(requestOptions.headers),
        responseType: requestOptions.responseType,
        contentType: requestOptions.contentType,
        extra: requestOptions.extra,
        followRedirects: requestOptions.followRedirects,
        validateStatus: requestOptions.validateStatus,
        receiveDataWhenStatusError: requestOptions.receiveDataWhenStatusError,
      );

      final response = await dio.request<dynamic>(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options,
        cancelToken: requestOptions.cancelToken,
        onSendProgress: requestOptions.onSendProgress,
        onReceiveProgress: requestOptions.onReceiveProgress,
      );

      return handler.resolve(response);
    } on DioException catch (e) {
      // Let Dio's default handling run if re-request fails
      return handler.next(e);
    } catch (e) {
      // Unknown error, rethrow original
      return handler.next(err);
    }
  }

  Duration _calculateDelay(int retryCount) {
    final random = Random();
    final jitter = random.nextDouble() * retryConfig.baseDelayInMilliseconds;
    final exponential = retryConfig.baseDelayInMilliseconds * pow(2, retryCount - 1);
    final rawMs = (exponential + jitter).toInt();
    final capped = rawMs.clamp(0, retryConfig.maxDelayInMilliseconds);
    return Duration(milliseconds: capped);
  }

  bool _shouldRetry(DioException error, int retryCount) {
    if (retryCount > retryConfig.maxRetries) return false;

    final method = error.requestOptions.method.toUpperCase();
    if (!retryConfig.allowedMethods.contains(method)) {
      // Not an idempotent method by your config; don't retry unless explicitly forced (not recommended).
      return false;
    }

    // Per-request override for which status codes to retry
    final perRequestCodes = error.requestOptions.getRetryErrorStatusCodes(retryErrorConditionsKey);
    final statusCodesToCheck = perRequestCodes.isNotEmpty ? perRequestCodes : retryConfig.defaultRetryableStatusCodes;

    final status = error.response?.statusCode;
    final isRetryableStatus = status != null && statusCodesToCheck.contains(status);

    // DioException types that often indicate transient network errors
    final isNetworkTimeout = error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.connectionError;

    return isNetworkTimeout || isRetryableStatus;
  }
}

extension RequestOptionsRetryExtension on RequestOptions {
  bool isRetryEnabled(String key) => (extra[key] as bool?) ?? false;

  List<int> getRetryErrorStatusCodes(String key) {
    final statusCodes = extra[key] as List<int>?;
    return statusCodes ?? [];
  }

  int get retryCount => (extra['retryCount'] as int?) ?? 0;
  set retryCount(int value) => extra['retryCount'] = value;
}
