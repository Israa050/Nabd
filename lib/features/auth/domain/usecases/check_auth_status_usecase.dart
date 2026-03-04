import '../../domain/entities/user_entity.dart';
import '../repositories/auth_repository.dart';

class CheckAuthStatusUseCase {
  final AuthRepository authRepository;

  CheckAuthStatusUseCase({required this.authRepository});

  Stream<UserEntity?> get authStateChanges => authRepository.authStateChanges;

  Future<UserEntity?> getCurrentUser() async {
    final result = await authRepository.getCurrentUser();
    // Return user if success, null if failure (or handle differently)
    return result.when(onSuccess: (user) => user, onError: (error) => null);
  }
}
