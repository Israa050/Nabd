import '../../../../core/networking/api_result.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<ApiResult<UserEntity>> login({
    required String email,
    required String password,
  });
  Future<ApiResult<UserEntity>> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  });
  Future<ApiResult<bool>> logout();
  Future<ApiResult<UserEntity?>> getCurrentUser();
  Stream<UserEntity?> get authStateChanges;
}
