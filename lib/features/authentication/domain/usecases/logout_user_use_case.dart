import 'package:fpdart/fpdart.dart';
import 'package:person_plan/core/helper/base_failure.dart';
import 'package:person_plan/features/authentication/domain/repositories/auth_repository.dart';

class LogoutUserUseCase {
  AuthRepository authRepository;

  LogoutUserUseCase(this.authRepository);

  Future<Either<Failure, String>> execute() async => await authRepository.logoutUser();
}
