import 'package:fpdart/fpdart.dart';
import 'package:person_plan/core/helper/aliases.dart';
import 'package:person_plan/core/helper/base_exception.dart';
import 'package:person_plan/core/helper/base_failure.dart';
import 'package:person_plan/core/helper/logger.dart';
import 'package:person_plan/core/i18n/l10n.dart';
import 'package:person_plan/core/services/isar/isar_service.dart';
import 'package:person_plan/core/services/shared_pref/shared_pref.dart';
import 'package:person_plan/features/authentication/data/datasources/auth_local_data_source.dart';
import 'package:person_plan/features/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:person_plan/features/authentication/domain/entities/user_entity.dart';
import 'package:person_plan/features/authentication/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource authRemoteDataSource,
    required AuthLocalDataSource localDataSource,
  })  : _authRemoteDataSource = authRemoteDataSource,
        _localDataSource = localDataSource;

  final AuthRemoteDataSource _authRemoteDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  FutureResult<UserEntity> loginWithGoogle() => _loginWithGoogle();

  @override
  FutureResult<UserEntity> loginWithApple() => _loginWithApple();

  @override
  FutureResultString logoutUser() => _logoutUser();

  @override
  FutureResult<UserEntity> getUser() => _getUser();

  FutureResult<UserEntity> _loginWithGoogle() {
    return _safeCall('loginWithGoogle', () async {
      final userModel = await _authRemoteDataSource.signInWithGoogle();
      // initialize Isar and create local DB with userId
      await IsarService.handleUserLogin(userModel.uid);
      // save user to local DB
      await _localDataSource.saveUserOnLocalDB(userModel);
      printLog('User signed in with Google: $userModel');
      return userModel.toEntity();
    });
  }

  FutureResult<UserEntity> _loginWithApple() {
    return _safeCall('loginWithApple', () async {
      final userModel = await _authRemoteDataSource.signInWithApple();
      // initialize Isar and create local DB with userId
      await IsarService.handleUserLogin(userModel.uid);
      // save user to local DB
      await _localDataSource.saveUserOnLocalDB(userModel);
      return userModel.toEntity();
    });
  }

  FutureResultString _logoutUser() {
    return _safeCall('logoutUser', () async {
      await _authRemoteDataSource.signOut();
      await _localDataSource.deleteUserFromLocalDB();
      await IsarService.handleUserLogout();
      await SharedPrefUtils.clearOnLogout();
      printLog('User signed out');
      return I18n.current.sign_out_success;
    });
  }

  FutureResult<UserEntity> _getUser() {
    return _safeCall('getUser', () async {
      final userModel = await _localDataSource.getUserFromLocalDB();
      final user = userModel?.toEntity();
      if (user == null) {
        throw BaseException.userDataFailure();
      }
      printLog('User fetched from local db: $user');
      return user;
    });
  }

  /// Common error handler for async operations
  FutureResult<T> _safeCall<T>(
    String methodName,
    Future<T> Function() action,
  ) async {
    try {
      final result = await action();
      return Right(result);
    } on BaseException catch (e) {
      printError('BaseException in $methodName: ${e.message}');
      return Left(BaseFailure(e.message));
    } catch (e) {
      final exception = BaseException.unexpected(methodName);
      printError('Exception in $methodName: $e');
      return Left(BaseFailure(exception.message));
    }
  }
}
