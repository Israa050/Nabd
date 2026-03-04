

import '../models/api_error_model.dart';

abstract class ApiErrorParser {
  /// Returns an ApiErrorModel if the parser matches, otherwise null
  ApiErrorModel? parse(Map<String, dynamic> data);
}