import '../../domain/repositories/biometric_repository.dart';
import '../datasources/biometric_local_datasource.dart';

class BiometricRepositoryImpl implements BiometricRepository {
  final BiometricLocalDataSource localDataSource;

  BiometricRepositoryImpl(this.localDataSource);

  @override
  Future<bool> authenticate() async {
    return await localDataSource.authenticate();
  }

  @override
  Future<bool> isAvailable() async {
    return await localDataSource.isAvailable();
  }
}
