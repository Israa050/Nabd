import 'package:flutter/material.dart';
import 'models/api_error_model.dart';
import '../utils/app_constants.dart';

class ApiErrorFactory {
  static ApiErrorModel _build(String title, String msg, IconData icon) {
    return ApiErrorModel(
      errorTitle: title,
      errorDetails: msg,
      errorIcon: icon,
    );
  }

  static ApiErrorModel get defaultError =>
      _build(AppConstants.unknownErrorTitle, AppConstants.unknownErrorMessage, AppConstants.unknownErrorIcon);

  static ApiErrorModel get connectionError =>
      _build(AppConstants.connectionErrorTitle, AppConstants.connectionErrorMessage, AppConstants.connectionErrorIcon);

  static ApiErrorModel get timeoutError =>
      _build(AppConstants.timeoutErrorTitle, AppConstants.timeoutErrorMessage, AppConstants.timeoutErrorIcon);

  static ApiErrorModel get certificateError =>
      _build(AppConstants.certificateErrorTitle, AppConstants.certificateErrorMessage, AppConstants.certificateErrorIcon);

  static ApiErrorModel get cancelledRequestError =>
      _build(AppConstants.cancelledRequestTitle, AppConstants.cancelledRequestMessage, AppConstants.cancelledRequestIcon);

  static ApiErrorModel get sendTimeoutError =>
      _build(AppConstants.sendTimeoutTitle, AppConstants.sendTimeoutMessage, AppConstants.sendTimeoutIcon);

  static ApiErrorModel get receiveTimeoutError =>
      _build(AppConstants.receiveTimeoutTitle, AppConstants.receiveTimeoutMessage, AppConstants.receiveTimeoutIcon);
}
