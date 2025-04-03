import 'package:person_plan/features/authentication/domain/repositories/auth_repository.dart';

class LogoutUserUseCase {
  AuthRepository authRepository;

  LogoutUserUseCase(this.authRepository);
  Future<void> call() async {
    await authRepository.logoutUser();
  }
}
