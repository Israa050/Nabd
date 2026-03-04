import 'package:local_auth/local_auth.dart';

class BiometricLocalDataSource {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> authenticate() async {
    try {
      return await _auth.authenticate(
        localizedReason: 'Authenticate to continue',
        biometricOnly: true,
        persistAcrossBackgrounding: true,
      );
    } catch(e) {
      print('authenticate datasource ${e.toString()}');
      return false;
    }
  }

  Future<bool> isAvailable() async {
    final bool canCheckBiometrics = await _auth.canCheckBiometrics;
    final bool isDeviceSupported = await _auth.isDeviceSupported();
    return canCheckBiometrics || isDeviceSupported;
  }
}
