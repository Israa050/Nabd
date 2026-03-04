import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_error_model.dart';

class FirebaseErrorHandler {
  static FirebaseErrorModel handle(dynamic error) {
    if (error is FirebaseAuthException) {
      return FirebaseErrorModel(
        code: error.code,
        message: error.message ?? 'Authentication error occurred',
        plugin: error.plugin,
      );
    } else if (error is FirebaseException) {
      return FirebaseErrorModel(
        code: error.code,
        message: error.message ?? 'Firebase error occurred',
        plugin: error.plugin,
      );
    } else {
      return FirebaseErrorModel(code: 'unknown', message: error.toString());
    }
  }
}
