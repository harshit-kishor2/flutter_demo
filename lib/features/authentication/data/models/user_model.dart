import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:person_plan/features/authentication/domain/entities/user_entity.dart';

part 'user_model.g.dart';

@collection
class UserModel {
  /// Deserialize from JSON string
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  /// Convert a UserEntity into a UserModel
  factory UserModel.fromEntity(UserEntity entity) {
    return UserModel(
      uid: entity.uid,
      name: entity.name,
      email: entity.email,
      photoUrl: entity.photoUrl,
    );
  }

  /// Deserialize from Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      photoUrl: map['photoUrl'] as String,
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

  /// Convert this model to an entity
  UserEntity toEntity() {
    return UserEntity(
      uid: uid,
      name: name,
      email: email,
      photoUrl: photoUrl,
    );
  }

  /// Serialize to Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  /// Serialize to JSON string
  String toJson() => json.encode(toMap());
}
