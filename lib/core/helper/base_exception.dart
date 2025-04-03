import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:person_plan/core/constants/enum.dart';
import 'package:person_plan/core/i18n/l10n.dart';

class _ErrorCodes {
  static const String authCancelled = 'AUTH_CANCELLED';
  static const String tokenError = 'TOKEN_ERROR';
  static const String userDataError = 'USER_DATA_ERROR';
  static const String networkError = 'NETWORK_ERROR';
  static const String unexpectedError = 'UNEXPECTED_ERROR';
  static const String accountConflict = 'ACCOUNT_CONFLICT';
  static const String invalidCredentials = 'INVALID_CREDENTIALS';
  static const String methodNotAllowed = 'METHOD_NOT_ALLOWED';
  static const String userDisabled = 'USER_DISABLED';
  static const String userNotFound = 'USER_NOT_FOUND';
  static const String wrongPassword = 'WRONG_PASSWORD';
  static const String tooManyRequests = 'TOO_MANY_REQUESTS';
  static const String firebaseError = 'FIREBASE_ERROR';
  static const String signInFailed = 'SIGN_IN_FAILED';
  static const String platformError = 'PLATFORM_ERROR';
}

/// Base class for custom exceptions.
class BaseException implements Exception {
  final String code;
  final String message;

  BaseException(this.code, this.message);

  @override
  String toString() => '[$code] $message';

  // Predefined exception creators

  static BaseException cancelled(SocialLoginType method) =>
      BaseException(_ErrorCodes.authCancelled, I18n.current.AUTH_CANCELLED(method.name));

  static BaseException tokenFailure(SocialLoginType method) =>
      BaseException(_ErrorCodes.tokenError, I18n.current.TOKEN_ERROR(method.name));

  static BaseException userDataFailure() =>
      BaseException(_ErrorCodes.userDataError, I18n.current.USER_DATA_ERROR);
  static BaseException networkError() =>
      BaseException(_ErrorCodes.networkError, I18n.current.NETWORK_ERROR);

  static BaseException unexpected(String methodName) =>
      BaseException(_ErrorCodes.unexpectedError, I18n.current.UNEXPECTED_ERROR(methodName));

  static BaseException fromFirebaseAuth(FirebaseAuthException e) {
    switch (e.code) {
      case 'account-exists-with-different-credential':
        return BaseException(_ErrorCodes.accountConflict, I18n.current.ACCOUNT_CONFLICT);
      case 'invalid-credential':
        return BaseException(_ErrorCodes.invalidCredentials, I18n.current.INVALID_CREDENTIALS);
      case 'operation-not-allowed':
        return BaseException(_ErrorCodes.methodNotAllowed, I18n.current.METHOD_NOT_ALLOWED);
      case 'user-disabled':
        return BaseException(_ErrorCodes.userDisabled, I18n.current.USER_DISABLED);
      case 'user-not-found':
        return BaseException(_ErrorCodes.userNotFound, I18n.current.USER_NOT_FOUND);
      case 'wrong-password':
        return BaseException(_ErrorCodes.wrongPassword, I18n.current.WRONG_PASSWORD);
      case 'too-many-requests':
        return BaseException(_ErrorCodes.tooManyRequests, I18n.current.TOO_MANY_REQUESTS);
      case 'network-request-failed':
        return BaseException(_ErrorCodes.networkError, I18n.current.NETWORK_ERROR);
      default:
        return BaseException(
            _ErrorCodes.firebaseError, I18n.current.FIREBASE_ERROR(e.message ?? ''));
    }
  }

  static BaseException fromPlatform(PlatformException e) {
    switch (e.code) {
      case 'sign_in_failed':
        return BaseException(_ErrorCodes.signInFailed, I18n.current.SIGN_IN_FAILED);
      case 'network_error':
        return BaseException(_ErrorCodes.networkError, I18n.current.NETWORK_ERROR);
      default:
        return BaseException(
            _ErrorCodes.platformError, I18n.current.PLATFORM_ERROR(e.message ?? ''));
    }
  }
}
