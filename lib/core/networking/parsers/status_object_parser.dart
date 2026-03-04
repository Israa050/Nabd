

import '../models/api_error_model.dart';
import 'api_error_parser.dart';
import '../../utils/app_constants.dart';

class StatusObjectParser implements ApiErrorParser {
  @override
  ApiErrorModel? parse(Map<String, dynamic> data) {
    final statusJson = data['status'];
    if (statusJson is Map<String, dynamic>) {
      final errorMessage = statusJson['error_message'];
      if (errorMessage is String && errorMessage.isNotEmpty) {
        return ApiErrorModel(
          errorTitle: AppConstants.badResponseTitle,
          errorDetails: errorMessage,
          errorIcon: AppConstants.badResponseIcon,
        );
      }
    }
    return null;
  }
}