import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefKeys {
  static const String appVersion = "appVersion";
  static const String isDark = "isDark";
  static const String bearerToken = "bearerToken";
}

class SharedPref {
  late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setValue(String key, dynamic value) async {
    if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    } else if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    } else if (value is Map<String, dynamic>) {
      await _preferences.setString(key, jsonEncode(value));
    } else {
      throw UnsupportedError('Type ${value.runtimeType} is not supported');
    }
  }

  T getValue<T>(String key, {required T defaultValue}) {
    if (T == String) {
      return (_preferences.getString(key) ?? defaultValue) as T;
    } else if (T == bool) {
      return (_preferences.getBool(key) ?? defaultValue) as T;
    } else if (T == int) {
      return (_preferences.getInt(key) ?? defaultValue) as T;
    } else if (T == double) {
      return (_preferences.getDouble(key) ?? defaultValue) as T;
    } else if (T == Map<String, dynamic>) {
      final String? jsonString = _preferences.getString(key);
      return jsonString != null ? jsonDecode(jsonString) as T : defaultValue;
    }
    return defaultValue;
  }

// Getter Setter for Bearer Token
  Future<void> setBearerToken(String token) async {
    await setValue(SharedPrefKeys.bearerToken, token);
  }

  String get bearerToken => getValue<String>(SharedPrefKeys.bearerToken, defaultValue: "");

// Getter Setter for App Version
  Future<void> setAppVersion(String version) async {
    await setValue(SharedPrefKeys.appVersion, version);
  }

  String get appVersion => getValue<String>(SharedPrefKeys.appVersion, defaultValue: "");

// Getter Setter for isDark
  Future<void> setIsDarkMode(bool isDark) async {
    await setValue(SharedPrefKeys.isDark, isDark);
  }

  bool get isDark => getValue<bool>(SharedPrefKeys.isDark, defaultValue: false);

  Future<void> clearAll() async {
    await _preferences.clear();
  }

  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }
}
