import 'package:firebase_auth/firebase_auth.dart';
import 'package:crypto_demo/core/services/firebase/firebase_result.dart';
import 'package:crypto_demo/core/services/firebase/firebase_error_handler.dart';

class FirebaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseResult<User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      if (result.user != null) {
        return FirebaseResult.success(result.user!);
      } else {
        return FirebaseResult.failure(
          FirebaseErrorHandler.handle('User authentication failed'),
        );
      }
    } catch (e) {
      return FirebaseResult.failure(FirebaseErrorHandler.handle(e));
    }
  }

  Future<FirebaseResult<User>> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      if (result.user != null) {
        return FirebaseResult.success(result.user!);
      } else {
        return FirebaseResult.failure(
          FirebaseErrorHandler.handle('User creation failed'),
        );
      }
    } catch (e) {
      return FirebaseResult.failure(FirebaseErrorHandler.handle(e));
    }
  }

  Future<FirebaseResult<void>> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return  FirebaseResult.success(null);
    } catch (e) {
      return FirebaseResult.failure(FirebaseErrorHandler.handle(e));
    }
  }

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
}
