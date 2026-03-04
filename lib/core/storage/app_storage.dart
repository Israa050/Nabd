import 'package:shared_preferences/shared_preferences.dart';

class AppLaunchHelper {
  static const _keyHasSeenOnBoarding = 'has_seen_onboarding';
  static const _keyHasCompletedBiometricSetup = 'has_completed_biometric';

  // 🔹 OnBoarding
  static Future<bool> hasSeenOnBoarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyHasSeenOnBoarding) ?? false;
  }

  static Future<void> setOnBoardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyHasSeenOnBoarding, true);
  }

  // 🔹 Biometric Setup
  static Future<bool> hasCompletedBiometricSetup() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyHasCompletedBiometricSetup) ?? false;
  }

  static Future<void> setBiometricSetupCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyHasCompletedBiometricSetup, true);
  }

  static Future<void> resetBiometricSetup() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyHasCompletedBiometricSetup);
  }

  // 🔹 Theme Setup
  static const _keyThemeMode = 'app_theme_mode';

  static Future<bool?> getThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(
      _keyThemeMode,
    ); // true for dark, false for light, null for system
  }

  static Future<void> setThemeMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyThemeMode, isDark);
  }

  static Future<void> clearThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyThemeMode);
  }
}
