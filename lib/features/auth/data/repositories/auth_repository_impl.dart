import 'package:crypto_demo/core/storage/secure_storage_helper.dart';

import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/models/api_error_model.dart';

import '../../../../core/services/firebase/firebase_result.dart'; // Import FirebaseResult
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import 'package:flutter/material.dart'; // For IconData if needed

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImpl({required AuthRemoteDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<ApiResult<UserEntity>> login({
    required String email,
    required String password,
  }) async {
    final result = await _dataSource.login(email: email, password: password);
    return _mapFirebaseResultToApiResult(result);
  }

  @override
  Future<ApiResult<UserEntity>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    final result = await _dataSource.register(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
    );
    return _mapFirebaseResultToApiResult(result);
  }

  @override
  Future<ApiResult<bool>> logout() async {
    final result = await _dataSource.logout();
    return result.when(
      success: (_) => ApiResult.success(true),
      failure: (error) => ApiResult.error(
        ApiErrorModel(
          errorTitle: 'Logout Failed',
          errorDetails: error.message,
          errorIcon: Icons.error_outline,
        ),
      ),
    );
  }

  @override
  Future<ApiResult<UserEntity?>> getCurrentUser() async {
    final result = await _dataSource.getCurrentUser();
    return result.when(
      success: (user) => ApiResult.success(user),
      failure: (error) {
        // If error is "No user logged in", we might want to return success(null)?
        // Or strictly strictly error?
        // Existing logic usually expects UserEntity? so null is valid for "not logged in".
        // But logic says: if fetching fails, it's an error.
        // If we want to check if user is logged in, we use authStateChanges usually.
        // Let's return null if it's just "not logged in" case, but error otherwise.
        if (error.message == 'No user logged in') {
          return ApiResult.success(null);
        }
        return ApiResult.error(
          ApiErrorModel(
            errorTitle: 'Get User Failed',
            errorDetails: error.message,
            errorIcon: Icons.error_outline,
          ),
        );
      },
    );
  }

  @override
  Stream<UserEntity?> get authStateChanges => _dataSource.authStateChanges;

  ApiResult<T> _mapFirebaseResultToApiResult<T>(FirebaseResult<T> result) {
    return result.when(
      success: (data) => ApiResult.success(data),
      failure: (error) => ApiResult.error(
        ApiErrorModel(
          errorTitle: 'Authentication Error',
          errorDetails: error.message,
          errorIcon: Icons.error_outline,
        ),
      ),
    );
  }
}
