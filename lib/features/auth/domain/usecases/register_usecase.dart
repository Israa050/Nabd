import '../../../../core/networking/api_result.dart';
import '../../domain/entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  Future<ApiResult<UserEntity>> call({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  }) {
    return _authRepository.register(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
    );
  }
}
