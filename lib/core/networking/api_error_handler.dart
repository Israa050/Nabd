import 'package:dio/dio.dart';
import 'api_error_factory.dart';
import 'models/api_error_model.dart';
import 'parsers/error_key_parser.dart';
import 'parsers/status_object_parser.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is ApiErrorModel) {
      return error;
    }
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.connectionError:
          return ApiErrorFactory.connectionError;

        case DioExceptionType.connectionTimeout:
          return ApiErrorFactory.timeoutError;

        case DioExceptionType.receiveTimeout:
          return ApiErrorFactory.receiveTimeoutError;

        case DioExceptionType.sendTimeout:
          return ApiErrorFactory.sendTimeoutError;

        case DioExceptionType.badCertificate:
          return ApiErrorFactory.certificateError;

        case DioExceptionType.cancel:
          return ApiErrorFactory.cancelledRequestError;

        case DioExceptionType.badResponse:
          return _mapBadResponseToError(error.response?.data);

        default:
          return ApiErrorFactory.defaultError;
      }
    }
    return ApiErrorFactory.defaultError;
  }

  static ApiErrorModel _mapBadResponseToError(Map<String, dynamic>? data) {
    if (data == null) return ApiErrorFactory.defaultError;
    // Sequential parsers (order defines priority)
    final parsers = [
      ErrorKeyParser(),
      StatusObjectParser(),
      // Add new parsers here in the future
    ];
    for (final parser in parsers) {
      final result = parser.parse(data);
      if (result != null) return result;
    }
    return ApiErrorFactory.defaultError;
  }
}
