import '../../../../core/networking/api_result.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase({required AuthRepository authRepository})
    : _authRepository = authRepository;

  Future<ApiResult<bool>> call() {
    return _authRepository.logout();
  }
}
