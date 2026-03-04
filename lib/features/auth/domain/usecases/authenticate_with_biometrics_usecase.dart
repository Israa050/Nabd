
import 'package:crypto_demo/features/auth/domain/repositories/biometric_repository.dart';

class AuthenticateWithBiometricsUsecase {
   final BiometricRepository repository;

  AuthenticateWithBiometricsUsecase(this.repository);

  Future<bool> call() async {
    return await repository.authenticate();
  }
}