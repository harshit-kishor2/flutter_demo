import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fpdart/fpdart.dart';
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
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.authRemoteDataSource,
    required this.localDataSource,
  });

  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource localDataSource;

  /// Logs in the user with Google.
  ///
  /// Returns [Right] with a [UserEntity] if the login is successful.
  /// Returns [Left] with a [Failure] if an error occurs.
  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      // Sign in with Google
      final userModel = await authRemoteDataSource.signInWithGoogle();
      await SharedPrefUtils.setUserID(userModel.uid);
      await IsarService.handleUserLogin(userModel.uid);
      await localDataSource.saveUserOnLocalDB(userModel);
      final user = userModel.toEntity();
      printLog('User signed in with google: ${user.toString()}');
      return Right(user);
    } catch (e) {
      // Handle the error and return a failure
      return _handleAuthError(e, 'loginWithGoogle');
    }
  }

  /// Logs in the user with Apple.
  ///
  /// Returns [Right] with a [UserEntity] if the login is successful.
  /// Returns [Left] with a [Failure] if an error occurs.
  @override
  Future<Either<Failure, UserEntity>> loginWithApple() async {
    try {
      final userModel = await authRemoteDataSource.signInWithApple();
      await SharedPrefUtils.setUserID(userModel.uid);
      await IsarService.handleUserLogin(userModel.uid);
      await localDataSource.saveUserOnLocalDB(userModel);
      final user = userModel.toEntity();
      printLog('User signed in with apple: $user');
      return Right(user);
    } catch (e) {
      // Handle the error and return a failure
      return _handleAuthError(e, 'loginWithApple');
    }
  }

  /// Logs out the user from the Firebase authentication system.
  ///
  /// Returns [Right] with a success message if the logout is successful.
  /// Returns [Left] with a [Failure] if an error occurs.
  ///
  /// The logout process involves signing out from the Firebase authentication
  /// system, deleting the user from the local database, and clearing the
  /// authentication state.
  @override
  Future<Either<Failure, String>> logoutUser() async {
    try {
      // Sign out from Firebase
      await authRemoteDataSource.signOut();
      await localDataSource.deleteUserFromLocalDB();
      await IsarService.handleUserLogout();
      await SharedPrefUtils.clearOnLogout();
      printLog('User signed out');
      // Return a success message
      return Right(I18n.current.sign_out_success);
    } catch (e) {
      // Handle unexpected errors
      return _handleAuthError(e, 'logoutUser');
    }
  }

  /// Fetches the user from the local database.
  ///
  /// Returns [Right] with a [UserEntity] if the user is found in the local
  /// database.
  /// Returns [Left] with a [Failure] if an error occurs.
  @override
  Future<Either<Failure, UserEntity>> getUser() async {
    try {
      final userModel = await localDataSource.getUserFromLocalDB();
      final user = userModel?.toEntity();
      if (user == null) {
        throw BaseException.userDataFailure();
      }
      printLog('User fetched from local db: $user');
      return Right(user);
    } catch (e) {
      // Handle unexpected errors
      return _handleAuthError(e, 'getUser');
    }
  }

  /// Handles authentication errors and returns a failure.
  ///
  /// The [error] parameter is the error object that is thrown by the authentication
  /// method.
  ///
  /// The [methodName] parameter is the name of the method that threw the error.
  ///
  /// Returns a [Left] with a [Failure] if an error occurs.
  Either<Failure, T> _handleAuthError<T>(
    dynamic error,
    String methodName,
  ) {
    // Check if the error is a BaseException
    if (error is BaseException) {
      printError('Authentication error: ${error.code} - ${error.message}');
      return Left(BaseFailure(error.message));
    }

    if (error is SignInWithAppleAuthorizationException) {
      printError('Apple Authentication error: ${error.code} - ${error.message}');
      return Left(BaseFailure(error.message));
    }

    // Check if the error is a FirebaseAuthException
    if (error is FirebaseAuthException) {
      final exception = BaseException.fromFirebaseAuth(error);
      printError('Firebase auth error: ${exception.code} - ${exception.message}');
      return Left(BaseFailure(exception.message));
    }

    // Check if the error is a PlatformException
    if (error is PlatformException) {
      final exception = BaseException.fromPlatform(error);
      printError('Platform error: ${exception.code} - ${exception.message}');
      return Left(BaseFailure(exception.message));
    }

    // If the error is not a BaseException, FirebaseAuthException, or PlatformException,
    // then it is an unexpected error
    final exception = BaseException.unexpected(methodName);
    printError('Exception : ${exception.code} - ${exception.message}: $error');
    return Left(BaseFailure(exception.message));
  }
}
