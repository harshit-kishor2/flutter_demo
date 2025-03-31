part of 'shared_pref.dart';

abstract final class SharedPrefUtils {
  static final SharedPref _sharedPref = SharedPref();

  static Future<void> setBearerToken(String token) async {
    await _sharedPref.setValue(SharedPrefKeys.bearerToken, token);
  }

  static String get bearerToken =>
      _sharedPref.getValue<String>(SharedPrefKeys.bearerToken, defaultValue: "");

  static Future<void> setAppVersion(String version) async {
    await _sharedPref.setValue(SharedPrefKeys.appVersion, version);
  }

  static String get appVersion =>
      _sharedPref.getValue<String>(SharedPrefKeys.appVersion, defaultValue: "");

  static Future<void> setIsDarkMode(bool isDark) async {
    await _sharedPref.setValue(SharedPrefKeys.isDark, isDark);
  }

  static bool get isDark => _sharedPref.getValue<bool>(SharedPrefKeys.isDark, defaultValue: false);

  static Future<void> clearAll() async {
    await _sharedPref.clearAll();
  }

  static Future<void> remove(String key) async {
    await _sharedPref.remove(key);
  }
}
