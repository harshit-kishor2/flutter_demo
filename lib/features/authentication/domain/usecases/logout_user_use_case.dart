import 'package:fpdart/fpdart.dart';
import 'package:person_plan/core/helper/base_failure.dart';
import 'package:person_plan/features/authentication/domain/repositories/auth_repository.dart';

/// A use case to handle user logout.
///
/// This use case wraps the [AuthRepository.logoutUser] method and provides a
/// simpler way to handle user logout.
///
/// The [execute] method takes no arguments and returns a [Future] with an
/// [Either] containing a [Failure] or a [String].
///
/// The [Failure] is returned if the logout attempt fails.
/// The [String] is returned if the logout attempt is successful.
class LogoutUserUseCase {
  LogoutUserUseCase(this.authRepository);

  AuthRepository authRepository;

  Future<Either<Failure, String>> execute() async => await authRepository.logoutUser();
}
