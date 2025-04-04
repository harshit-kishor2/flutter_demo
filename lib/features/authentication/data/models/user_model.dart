import 'package:isar/isar.dart';
import 'package:person_plan/features/authentication/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@collection
class UserModel {
  /// Create UserModel from UserEntity
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      name: entity.name,
      email: entity.email,
      photoUrl: entity.photoUrl,
    );
  }
  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  Id id = Isar.autoIncrement;

  late String uid;
  late String name;
  late String email;
  late String photoUrl;

  /// Convert UserModel -> UserEntity
  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      name: name,
      email: email,
      photoUrl: photoUrl,
    );
  }
}
