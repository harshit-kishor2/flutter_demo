import 'package:fpdart/fpdart.dart';
import 'package:person_plan/features/authentication/domain/entities/user_entity.dart';
import 'package:person_plan/features/authentication/domain/repositories/auth_repository.dart';

class GoogleLoginUseCase {
  AuthRepository authRepository;

  GoogleLoginUseCase(this.authRepository);

  Future<Either<String, UserEntity>> call() => authRepository.loginWithGoogle();
}
