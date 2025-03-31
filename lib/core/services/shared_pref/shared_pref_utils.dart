part of 'shared_pref.dart';

abstract final class SharedPrefUtils {
  static final SharedPref _sharedPref = SharedPref();

//! =========== isFirstLaunch =========== //
  static Future<void> setIsFirstLaunch(bool value) async {
    await _sharedPref.setValue(SharedPrefKeys.isFirstLaunch, value);
  }

  static bool get isFirstLaunch =>
      _sharedPref.getValue<bool>(SharedPrefKeys.isFirstLaunch, defaultValue: true);

  static Future<void> handleFirstLaunch() async {
    if (isFirstLaunch) {
      await clearAll();
      await setIsFirstLaunch(false);
    }
  }

//! =========== isAuthenticated =========== //
  static Future<void> setIsAuthenticate(bool value) async {
    await _sharedPref.setValue(SharedPrefKeys.isAuthenticated, value);
  }

  static bool get isAuthenticated =>
      _sharedPref.getValue<bool>(SharedPrefKeys.isAuthenticated, defaultValue: false);

//! =========== BearerToken =========== //
  static Future<void> setBearerToken(String token) async {
    await _sharedPref.setValue(SharedPrefKeys.bearerToken, token);
  }

  static String get bearerToken =>
      _sharedPref.getValue<String>(SharedPrefKeys.bearerToken, defaultValue: "");

//! =========== appVersion =========== //
  static Future<void> setAppVersion(String version) async {
    await _sharedPref.setValue(SharedPrefKeys.appVersion, version);
  }

  static String get appVersion =>
      _sharedPref.getValue<String>(SharedPrefKeys.appVersion, defaultValue: "");

//! =========== isDark =========== //

  static Future<void> setIsDarkMode(bool isDark) async {
    await _sharedPref.setValue(SharedPrefKeys.isDark, isDark);
  }

  static bool get isDark => _sharedPref.getValue<bool>(SharedPrefKeys.isDark, defaultValue: false);

//! =========== clearAll =========== //

  static Future<void> clearAll() async {
    await _sharedPref.clearAll();
  }

//! =========== remove =========== //
  static Future<void> remove(String key) async {
    await _sharedPref.remove(key);
  }
}
