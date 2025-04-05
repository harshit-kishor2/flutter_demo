import 'dart:convert';
import 'package:person_plan/core/helper/base_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref_keys.dart';
part 'shared_pref_utils.dart';

class SharedPref {
  SharedPref._(this._preferences);

  static final String _instanceName = 'SharedPref';

  static SharedPref? _instance;
  final SharedPreferences _preferences;

  // Public getter
  static SharedPref get instance {
    if (_instance == null) {
      throw BaseException.initializationError(_instanceName);
    }
    return _instance!;
  }

  // Initialization method
  static Future<void> initialize() async {
    final prefs = await SharedPreferences.getInstance();
    _instance = SharedPref._(prefs);
  }

  Future<void> setValue<T>(String key, T value) async {
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
    try {
      if (T == String) {
        return (_preferences.getString(key) ?? defaultValue) as T;
      } else if (T == bool) {
        return (_preferences.getBool(key) ?? defaultValue) as T;
      } else if (T == int) {
        return (_preferences.getInt(key) ?? defaultValue) as T;
      } else if (T == double) {
        return (_preferences.getDouble(key) ?? defaultValue) as T;
      } else if (T == Map) {
        final String? jsonString = _preferences.getString(key);
        return jsonString != null ? jsonDecode(jsonString) as T : defaultValue;
      }
      return defaultValue;
    } catch (e) {
      return defaultValue;
    }
  }

  Future<void> remove(String key) async {
    await _preferences.remove(key);
  }

  Future<void> clearAll() async {
    await _preferences.clear();
  }
}
