import 'package:crypto_demo/core/services/firebase/firebase_result.dart';
import 'package:crypto_demo/core/services/firebase/firebase_error_handler.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/services/firestore_service.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<FirebaseResult<UserModel>> login({
    required String email,
    required String password,
  });
  Future<FirebaseResult<UserModel>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  });
  Future<FirebaseResult<void>> logout();
  Future<FirebaseResult<UserModel>> getCurrentUser();
  Stream<UserModel?> get authStateChanges;
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuthService _authService;
  final FirestoreService _firestoreService;

  AuthRemoteDataSourceImpl({
    required FirebaseAuthService authService,
    required FirestoreService firestoreService,
  }) : _authService = authService,
       _firestoreService = firestoreService;

  @override
  Future<FirebaseResult<UserModel>> login({
    required String email,
    required String password,
  }) async {
    final result = await _authService.signIn(email: email, password: password);

    return result.when(
      success: (user) async {
        final docResult = await _firestoreService.getDocument(
          path: 'users/${user.uid}',
        );

        return docResult.when(
          success: (snapshot) {
            if (snapshot.exists && snapshot.data() != null) {
              return FirebaseResult.success(
                UserModel.fromJson(snapshot.data()!),
              );
            } else {
              return FirebaseResult.failure(
                FirebaseErrorHandler.handle('User profile not found'),
              );
            }
          },
          failure: (error) => FirebaseResult.failure(error),
        );
      },
      failure: (error) => FirebaseResult.failure(error),
    );
  }

  @override
  Future<FirebaseResult<UserModel>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    final result = await _authService.signUp(email: email, password: password);

    return result.when(
      success: (user) async {
        final newUser = UserModel(
          uid: user.uid,
          email: email,
          firstName: firstName,
          lastName: lastName,
          phone: phone,
        );

        final setDocResult = await _firestoreService.setData(
          path: 'users/${user.uid}',
          data: newUser.toJson(),
        );

        return setDocResult.when(
          success: (_) => FirebaseResult.success(newUser),
          failure: (error) => FirebaseResult.failure(error),
        );
      },
      failure: (error) => FirebaseResult.failure(error),
    );
  }

  @override
  Future<FirebaseResult<void>> logout() async {
    return _authService.signOut();
  }

  @override
  Future<FirebaseResult<UserModel>> getCurrentUser() async {
    final user = _authService.currentUser;
    if (user == null) {
      return FirebaseResult.failure(
        FirebaseErrorHandler.handle('No user logged in'),
      );
    }

    final docResult = await _firestoreService.getDocument(
      path: 'users/${user.uid}',
    );

    return docResult.when(
      success: (snapshot) {
        if (snapshot.exists && snapshot.data() != null) {
          return FirebaseResult.success(UserModel.fromJson(snapshot.data()!));
        } else {
          return FirebaseResult.failure(
            FirebaseErrorHandler.handle('User profile not found'),
          );
        }
      },
      failure: (error) => FirebaseResult.failure(error),
    );
  }

  @override
  Stream<UserModel?> get authStateChanges {
    return _authService.authStateChanges.asyncMap((user) async {
      if (user == null) return null;
      final docResult = await _firestoreService.getDocument(
        path: 'users/${user.uid}',
      );

      return docResult.when(
        success: (snapshot) {
          if (snapshot.exists && snapshot.data() != null) {
            return UserModel.fromJson(snapshot.data()!);
          }
          return null;
        },
        failure: (error) => null,
      );
    });
  }
}
