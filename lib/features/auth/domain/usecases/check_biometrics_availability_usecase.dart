
import 'package:crypto_demo/features/auth/domain/repositories/biometric_repository.dart';

class CheckBiometricsAvailabilityUsecase {
  final BiometricRepository repository;

  CheckBiometricsAvailabilityUsecase(this.repository);

  Future<bool> call() async {
    return await repository.isAvailable();
  }
}