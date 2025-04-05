import 'package:person_plan/core/services/isar/isar_service.dart';
import 'package:person_plan/core/services/shared_pref/shared_pref.dart';
import 'package:person_plan/features/authentication/data/models/user_model.dart';

class AuthLocalDataSource {
  AuthLocalDataSource();

  Future<void> saveUserOnLocalDB(UserModel user) async {
    await SharedPrefUtils.setUserID(user.uid);
    await IsarService.instance.saveUser(user);
  }

  Future<UserModel?> getUserFromLocalDB() async {
    final savedUserID = SharedPrefUtils.getUserID;
    return await IsarService.instance.getUserByUid(savedUserID);
  }

  Future<void> deleteUserFromLocalDB() async {
    // await IsarService.instance.deleteUserByUid(SharedPrefUtils.getUserID);
  }
}
