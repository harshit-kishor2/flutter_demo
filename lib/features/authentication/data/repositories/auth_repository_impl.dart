// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';
import 'package:person_plan/core/services/shared_pref/shared_pref.dart';
import 'package:person_plan/features/authentication/data/datasources/auth_local_data_source.dart';

import 'package:person_plan/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:person_plan/features/authentication/domain/entities/user_entity.dart';
import 'package:person_plan/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<Either<String, UserEntity>> loginWithGoogle() async {
    try {
      final user = await authRemoteDataSource.signInWithGoogle();
      await localDataSource.saveUserOnLocalDB(user);
      await SharedPrefUtils.setIsAuthenticate(true);
      return Right(user);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
