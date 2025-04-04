import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:person_plan/core/services/shared_pref/shared_pref.dart';
import 'package:person_plan/features/authentication/data/models/user_model.dart';

class IsarService {
  // 🔒 Private constructor
  IsarService._();

  // 🧠 Static instance
  static IsarService? _instance;

  // 📦 Isar database instance
  Isar? _isar;

  // Getter for isar with safety check
  Isar get isar {
    if (_isar == null || !_isar!.isOpen) {
      throw Exception('Isar database is not initialized or has been closed');
    }
    return _isar!;
  }

  // ✅ Public getter with safety check
  static IsarService get instance {
    if (_instance == null) {
      throw Exception('IsarService has not been initialized. Call initialize() first.');
    }
    return _instance!;
  }

  static IsarService? get instanceOrNull => _instance;

  /// 🏁 Initialize Isar on App Start
  static Future<void> initialize() async {
    final userId = SharedPrefUtils.getUserID;
    if (userId.isNotEmpty) {
      await _initializeForUser(userId);
    } else {
      // Create instance without database when no user is logged in
      _instance ??= IsarService._();
    }
  }

  /// 🌟 Initialize Database for a Specific User
  static Future<void> _initializeForUser(String userId) async {
    if (userId.isEmpty) {
      throw Exception('User ID cannot be empty');
    }
    final currentIsar = _instance?._isar;

    if (currentIsar != null && currentIsar.isOpen && currentIsar.name == 'isar_$userId') {
      return;
    }

    await _instance?.closeDatabase();

    final dir = await getApplicationDocumentsDirectory();
    final newIsar = await Isar.open(
      [
        UserModelSchema,
      ],
      directory: dir.path,
      name: 'isar_$userId', // Unique DB for each user
    );
    _instance = IsarService._().._isar = newIsar;
  }

  /// 🔑 Handle User Login & Database Switch
  static Future<void> handleUserLogin(String userId) async {
    await _initializeForUser(userId);
  }

  /// 🚪 Close Database
  Future<void> closeDatabase() async {
    if (_isar?.isOpen ?? false) {
      await _isar!.close();
    }
    _isar = null;
  }

  /// 🧼 Handle User Logout
  static Future<void> handleUserLogout() async {
    await _instance?.closeDatabase();
    _instance = null;
  }

  /// 👤 Save a User to Isar
  Future<void> saveUser(UserModel user) async {
    await isar.writeTxn(() async {
      await isar.userModels.put(user);
    });
  }

  /// 🔍 Get User by UID
  Future<UserModel?> getUserByUid(String uid) async {
    if (_isar?.isOpen != true) {
      return null;
    }
    return await isar.userModels.filter().uidEqualTo(uid).findFirst();
  }

  /// ❌ Delete User by UID
  Future<void> deleteUserByUid(String uid) async {
    if (_isar?.isOpen != true) {
      return;
    }
    await isar.writeTxn(() async {
      final user = await getUserByUid(uid);
      if (user != null) {
        await isar.userModels.delete(user.id);
      }
    });
  }

  /// 🧼 Clear All Users
  Future<void> clearAllUsers() async {
    if (_isar?.isOpen != true) {
      return;
    }
    await isar.writeTxn(() async {
      await isar.userModels.clear();
    });
  }
}
