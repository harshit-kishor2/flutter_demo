import 'package:person_plan/features/authentication/data/models/user_model.dart';

class AuthLocalDataSource {
  AuthLocalDataSource();

  Future<void> saveUserOnLocalDB(UserModel user) async {
    // await hiveService.saveUser(user);
  }
}
