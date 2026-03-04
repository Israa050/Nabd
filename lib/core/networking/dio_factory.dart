import 'package:dio/dio.dart';
import 'package:crypto_demo/core/networking/interceptors/logging_interceptor.dart';
import 'package:crypto_demo/core/networking/interceptors/cache_interceptor.dart';
import 'package:crypto_demo/core/networking/interceptors/retry_interceptor.dart';
import 'package:crypto_demo/core/networking/models/retry_config.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio instance({RetryConfig? retryConfig}) {
    if (_dio != null) return _dio!;

    final config = retryConfig ?? RetryConfig.defaultConfig;

    const timeout = Duration(seconds: 30);

    _dio = Dio(
      BaseOptions(
        connectTimeout: timeout,
        receiveTimeout: timeout,
        headers: {
          'Accept': 'application/json',
        },
      ),
    );

    _addInterceptors(config);
    return _dio!;
  }

  static void _addInterceptors(RetryConfig retryConfig) {
    // Order matters:
    // - LoggingInterceptor: you may want to keep it but avoid duplicating logs for retries.
    // - CacheInterceptor: should typically run before network; depends on your cache strategy.
    // - RetryInterceptor: place before network layer so it can intercept network errors and attempt retry.
    _dio!.interceptors.addAll([
      LoggingInterceptor.build(),
      CacheInterceptor.build(),
      RetryInterceptor(dio: _dio!, retryConfig: retryConfig),
    ]);
  }
}
