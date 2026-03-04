
part of 'biometric_cubit.dart';

abstract class BiometricState {}

class BiometricInitial extends BiometricState {}

class BiometricLoading extends BiometricState {}

class BiometricAvailabilityChecked extends BiometricState {
  final bool isAvailable;

  BiometricAvailabilityChecked(this.isAvailable);
}

class BiometricSuccess extends BiometricState {}

class BiometricFailure extends BiometricState {}

class BiometricSkipped extends BiometricState {}

class FingerPrintSetupSuccess extends BiometricState {}

class FingerPrintSetupFailure extends BiometricState {}

class FaceIdSetupSuccess extends BiometricState {}

class FaceIdSetupFailure extends BiometricState {}

