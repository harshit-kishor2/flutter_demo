import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.uid,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  final String uid;
  final String name;
  final String email;
  final String photoUrl;

  @override
  List<Object> get props => [uid, name, email, photoUrl];

  @override
  bool get stringify => true;
}
