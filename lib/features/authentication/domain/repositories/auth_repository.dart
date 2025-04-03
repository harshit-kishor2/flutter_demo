import 'package:fpdart/fpdart.dart';
import 'package:person_plan/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<String, UserEntity>> loginWithGoogle();
  Future<Either<String, String>> logoutUser();
}
