import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref_keys.dart';
part 'shared_pref_utils.dart';

class SharedPref {
  factory SharedPref() => _instance;

  SharedPref._internal();

  static final SharedPref _instance = SharedPref._internal();

  SharedPreferences? _preferences;

  Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> setValue<T>(String key, T value) async {
    if (_preferences == null) {
      return;
    }

    if (value is String) {
      await _preferences!.setString(key, value);
    } else if (value is bool) {
      await _preferences!.setBool(key, value);
    } else if (value is int) {
      await _preferences!.setInt(key, value);
    } else if (value is double) {
      await _preferences!.setDouble(key, value);
    } else if (value is Map<String, dynamic>) {
      await _preferences!.setString(key, jsonEncode(value));
    } else {
      throw UnsupportedError('Type ${value.runtimeType} is not supported');
    }
  }

  T getValue<T>(String key, {required T defaultValue}) {
    if (_preferences == null) {
      return defaultValue;
    }

    if (T == String) {
      return (_preferences!.getString(key) ?? defaultValue) as T;
    } else if (T == bool) {
      return (_preferences!.getBool(key) ?? defaultValue) as T;
    } else if (T == int) {
      return (_preferences!.getInt(key) ?? defaultValue) as T;
    } else if (T == double) {
      return (_preferences!.getDouble(key) ?? defaultValue) as T;
    } else if (T == Map<String, dynamic>) {
      final String? jsonString = _preferences!.getString(key);
      return jsonString != null ? jsonDecode(jsonString) as T : defaultValue;
    }
    return defaultValue;
  }

  Future<void> clearAll() async => _preferences?.clear();
  Future<void> remove(String key) async => _preferences?.remove(key);
}
