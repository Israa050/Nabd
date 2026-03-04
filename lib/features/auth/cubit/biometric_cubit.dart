import 'package:crypto_demo/core/storage/secure_storage_helper.dart';
import 'package:crypto_demo/features/auth/domain/usecases/authenticate_with_biometrics_usecase.dart';
import 'package:crypto_demo/features/auth/domain/usecases/check_biometrics_availability_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'biometric_state.dart';

class BiometricCubit extends Cubit<BiometricState> {
  final AuthenticateWithBiometricsUsecase authenticateUseCase;
  final CheckBiometricsAvailabilityUsecase checkAvailabilityUseCase;

  BiometricCubit({
    required this.authenticateUseCase,
    required this.checkAvailabilityUseCase,
  }) : super(BiometricInitial());

  Future<void> checkBiometric() async {
    emit(BiometricLoading());

    final isAvailable = await checkAvailabilityUseCase();

    emit(BiometricAvailabilityChecked(isAvailable));
  }

  Future<void> authenticate() async {
    emit(BiometricLoading());

    final success = await authenticateUseCase();

    if (success) {
      emit(BiometricSuccess());
    } else {
      emit(BiometricFailure());
    }
  }

  Future<void> setupFingerPrint() async {

    final success = await authenticateUseCase();

    if (success) {
      emit(FingerPrintSetupSuccess());
      await SecureStorageHelper.setBiometricEnabled(true);
    } else {
      emit(FingerPrintSetupFailure());
    }
  }

  Future<void> setupFaceId() async {
    emit(BiometricLoading());

    final success = await authenticateUseCase();

    if (success) {
      emit(FaceIdSetupSuccess());
    } else {
      emit(FaceIdSetupFailure());
    }
  }

  Future<void> skipBiometric() async {
    emit(BiometricSkipped());
  }


}
