import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class LoggingInterceptor {
  static Interceptor build() {
    return PrettyDioLogger(
      requestBody: false,
      requestHeader: true,
      responseHeader: true,
      responseBody: true,
    );
  }
}