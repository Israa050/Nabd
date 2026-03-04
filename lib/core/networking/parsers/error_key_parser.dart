

import '../models/api_error_model.dart';
import 'api_error_parser.dart';
import '../../utils/app_constants.dart';

class ErrorKeyParser implements ApiErrorParser {
  @override
  ApiErrorModel? parse(Map<String, dynamic> data) {
    final error = data['error'];
    if (error is String && error.isNotEmpty) {
      return ApiErrorModel(
        errorTitle: AppConstants.badResponseTitle,
        errorDetails: error,
        errorIcon: AppConstants.badResponseIcon,
      );
    }
    return null;
  }
}