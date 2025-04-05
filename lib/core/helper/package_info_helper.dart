import 'package:package_info_plus/package_info_plus.dart';
import 'package:person_plan/core/helper/base_exception.dart';

class PackageInfoHelper {
  // Private constructor for singleton pattern
  PackageInfoHelper._();

  static final String _instanceName = 'PackageInfoHelper';

  // Static instance to be initialized
  static PackageInfoHelper? _instance;

  // Synchronous getter for the instance (assumes init has been called)
  static PackageInfoHelper get instance {
    if (_instance == null) {
      throw BaseException.initializationError(_instanceName);
    }
    return _instance!;
  }

  // Asynchronous initialization method
  static Future<void> initialize() async {
    _instance = PackageInfoHelper._();
    await _instance!._init();
  }

  late PackageInfo _packageInfo;

  // Initialize package info
  Future<void> _init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }

  // Getter methods for package information
  String get appName => _packageInfo.appName;
  String get packageName => _packageInfo.packageName;
  String get version => _packageInfo.version;
  String get buildNumber => _packageInfo.buildNumber;
}
