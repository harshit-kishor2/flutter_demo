import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class DeviceInfoHelper {
  // Private constructor
  DeviceInfoHelper._(this._deviceInfo);

  // Static instance
  static DeviceInfoHelper? _instance;

  // Synchronous getter for the instance (assumes init has been called)
  static DeviceInfoHelper get instance {
    if (_instance == null) {
      throw Exception('DeviceInfoHelper has not been initialized. Call initialize() first.');
    }
    return _instance!;
  }

  // Asynchronous initialization method
  static Future<void> initialize() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    _instance = DeviceInfoHelper._(deviceInfo);
  }

  final BaseDeviceInfo _deviceInfo;

  // Synchronous getter for device info as a map
  Map<String, dynamic> get deviceInfoMap => _deviceInfo.data;

  // Synchronous platform-specific getters
  String getDeviceName() {
    if (kIsWeb) {
      return (_deviceInfo as WebBrowserInfo).browserName.name;
    } else if (_deviceInfo is AndroidDeviceInfo) {
      return _deviceInfo.model;
    } else if (_deviceInfo is IosDeviceInfo) {
      return _deviceInfo.name;
    } else if (_deviceInfo is WindowsDeviceInfo) {
      return _deviceInfo.computerName;
    } else if (_deviceInfo is LinuxDeviceInfo) {
      return _deviceInfo.name;
    } else if (_deviceInfo is MacOsDeviceInfo) {
      return _deviceInfo.computerName;
    }
    return 'Unknown Device';
  }

  String getDeviceId() {
    if (kIsWeb) {
      return (_deviceInfo as WebBrowserInfo).appCodeName ?? 'Unknown Web ID';
    } else if (_deviceInfo is AndroidDeviceInfo) {
      return _deviceInfo.id;
    } else if (_deviceInfo is IosDeviceInfo) {
      return _deviceInfo.identifierForVendor ?? 'Unknown ID';
    } else if (_deviceInfo is WindowsDeviceInfo) {
      return _deviceInfo.deviceId;
    } else if (_deviceInfo is LinuxDeviceInfo) {
      return _deviceInfo.machineId ?? 'Unknown ID';
    } else if (_deviceInfo is MacOsDeviceInfo) {
      return _deviceInfo.systemGUID ?? 'Unknown ID';
    }
    return 'Unknown ID';
  }

  String getOsVersion() {
    if (kIsWeb) {
      return (_deviceInfo as WebBrowserInfo).platform ?? 'Unknown Web Platform';
    } else if (_deviceInfo is AndroidDeviceInfo) {
      return _deviceInfo.version.release;
    } else if (_deviceInfo is IosDeviceInfo) {
      return _deviceInfo.systemVersion;
    } else if (_deviceInfo is WindowsDeviceInfo) {
      return _deviceInfo.productName;
    } else if (_deviceInfo is LinuxDeviceInfo) {
      return _deviceInfo.version ?? 'Unknown';
    } else if (_deviceInfo is MacOsDeviceInfo) {
      return _deviceInfo.osRelease;
    }
    return 'Unknown OS Version';
  }

// End of class
}
