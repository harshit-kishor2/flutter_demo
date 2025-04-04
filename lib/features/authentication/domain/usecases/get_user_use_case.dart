import 'package:fpdart/fpdart.dart';
import 'package:person_plan/core/helper/base_failure.dart';
import 'package:person_plan/features/authentication/domain/entities/user_entity.dart';
import 'package:person_plan/features/authentication/domain/repositories/auth_repository.dart';

class GetUserUseCase {
  GetUserUseCase(
    this.authRepository,
  );

  final AuthRepository authRepository;

  Future<Either<Failure, UserEntity>> execute() async {
    return await authRepository.getUser();
  }
}
