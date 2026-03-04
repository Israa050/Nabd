import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  SecureStorageHelper._();

  static const FlutterSecureStorage _storage =
      FlutterSecureStorage();

  // Keys
  static const String _emailKey = 'user_email';
  static const String _passwordKey = 'user_password';
  static const String _userCacheKey = 'user_cache';
  static const String _biometricEnabledKey = 'biometric_enabled';

  /// ================================
  /// Store Credentials (for biometric login)
  /// ================================
  static Future<void> storeCredentials({
    required String email,
    required String password,
  }) async {
    await _storage.write(key: _emailKey, value: email);
    await _storage.write(key: _passwordKey, value: password);
  }

  static Future<Map<String, String>?> getCredentials() async {
    final email = await _storage.read(key: _emailKey);
    final password = await _storage.read(key: _passwordKey);

    if (email == null || password == null) return null;

    return {
      'email': email,
      'password': password,
    };
  }

  static Future<void> clearCredentials() async {
    await _storage.delete(key: _emailKey);
    await _storage.delete(key: _passwordKey);
  }

  /// ================================
  /// Optional: Store Cached User Object
  /// ================================
  static Future<void> storeUserCache(Map<String, dynamic> userJson) async {
    await _storage.write(
      key: _userCacheKey,
      value: jsonEncode(userJson),
    );
  }

  static Future<Map<String, dynamic>?> getUserCache() async {
    final data = await _storage.read(key: _userCacheKey);
    if (data == null) return null;
    return jsonDecode(data);
  }

  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }

  static Future<void> setBiometricEnabled(bool value) async {
  await _storage.write(
    key: _biometricEnabledKey,
    value: value.toString(),
  );
}

static Future<bool> isBiometricEnabled() async {
  final value = await _storage.read(key: _biometricEnabledKey);
  if(value == null) return false;
  return value == 'true';
}
}