import 'package:fpdart/fpdart.dart';
import 'package:person_plan/core/helper/base_failure.dart';
import 'package:person_plan/features/authentication/domain/entities/user_entity.dart';
import 'package:person_plan/features/authentication/domain/repositories/auth_repository.dart';

class AppleLoginUseCase {
  final AuthRepository authRepository;

  AppleLoginUseCase(this.authRepository);

  Future<Either<Failure, UserEntity>> execute() async => await authRepository.loginWithApple();
}
