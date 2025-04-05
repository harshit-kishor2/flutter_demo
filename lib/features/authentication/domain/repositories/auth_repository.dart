import 'package:person_plan/core/helper/aliases.dart';
import 'package:person_plan/features/authentication/domain/entities/user_entity.dart';

abstract class AuthRepository {
  FutureResult<UserEntity> loginWithGoogle();
  FutureResult<UserEntity> loginWithApple();
  FutureResultString logoutUser();
  FutureResult<UserEntity> getUser();
}
