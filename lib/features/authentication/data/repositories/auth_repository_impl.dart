import 'package:fpdart/fpdart.dart';
import 'package:person_plan/core/helper/logger.dart';
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
      await Future.wait([
        localDataSource.saveUserOnLocalDB(user),
        SharedPrefUtils.setIsAuthenticate(true),
      ]);
      return Right(user);
    } catch (e) {
      printError('Error logging in with Google:');
      return Left('Error logging in with Google.');
    }
  }

  @override
  Future<Either<String, String>> logoutUser() async {
    try {
      await authRemoteDataSource.signOut();
      await Future.wait([
        localDataSource.deleteUserFromLocalDB(),
        SharedPrefUtils.clearOnLogout(),
      ]);
      return Right('User logged out successfully.');
    } catch (e) {
      printError('Error logging out:');
      return Left('Error logging out.');
    }
  }
}
