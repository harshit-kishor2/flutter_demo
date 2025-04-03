import 'package:fpdart/fpdart.dart';
import 'package:person_plan/core/helper/base_failure.dart';
import 'package:person_plan/features/authentication/domain/entities/user_entity.dart';
import 'package:person_plan/features/authentication/domain/repositories/auth_repository.dart';

/// A use case to handle user login using Google authentication.
///
/// This use case wraps the [AuthRepository.loginWithGoogle] method and provides
/// a simpler way to handle Google sign-in.
///
/// The [execute] method takes no arguments and returns a [Future] with an
/// [Either] containing a [Failure] or a [UserEntity].
///
/// The [Failure] is returned if the login attempt fails.
/// The [UserEntity] is returned if the login attempt is successful.
class GoogleLoginUseCase {
  final AuthRepository authRepository;

  GoogleLoginUseCase(this.authRepository);

  Future<Either<Failure, UserEntity>> execute() async {
    return await authRepository.loginWithGoogle();
  }
}
