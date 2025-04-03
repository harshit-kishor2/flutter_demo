import 'package:person_plan/features/authentication/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.uid, required super.name, required super.email, required super.photoUrl});
}
