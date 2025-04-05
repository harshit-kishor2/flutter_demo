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
  BaseException(this.code, this.message);

  final String code;
  final String message;

  @override
  String toString() => '[$code] $message';

  // Predefined exception creators

  static BaseException cancelled(SocialLoginType method) =>
      BaseException(_ErrorCodes.authCancelled, I18n.current.auth_cancelled(method.name));

  static BaseException tokenFailure(SocialLoginType method) =>
      BaseException(_ErrorCodes.tokenError, I18n.current.token_error(method.name));

  static BaseException userDataFailure() =>
      BaseException(_ErrorCodes.userDataError, I18n.current.user_data_error);
  static BaseException networkError() =>
      BaseException(_ErrorCodes.networkError, I18n.current.network_error);

  static BaseException unexpected(String methodName) =>
      BaseException(_ErrorCodes.unexpectedError, I18n.current.unexpected_error(methodName));

  static BaseException fromFirebaseAuth(FirebaseAuthException e) {
    switch (e.code) {
      case 'account-exists-with-different-credential':
        return BaseException(_ErrorCodes.accountConflict, I18n.current.account_conflict);
      case 'invalid-credential':
        return BaseException(_ErrorCodes.invalidCredentials, I18n.current.invalid_credentials);
      case 'operation-not-allowed':
        return BaseException(_ErrorCodes.methodNotAllowed, I18n.current.method_not_allowed);
      case 'user-disabled':
        return BaseException(_ErrorCodes.userDisabled, I18n.current.user_disabled);
      case 'user-not-found':
        return BaseException(_ErrorCodes.userNotFound, I18n.current.user_not_found);
      case 'wrong-password':
        return BaseException(_ErrorCodes.wrongPassword, I18n.current.wrong_password);
      case 'too-many-requests':
        return BaseException(_ErrorCodes.tooManyRequests, I18n.current.too_many_requests);
      case 'network-request-failed':
        return BaseException(_ErrorCodes.networkError, I18n.current.network_error);
      default:
        return BaseException(
            _ErrorCodes.firebaseError, I18n.current.firebase_error(e.message ?? ''));
    }
  }

  static BaseException fromPlatform(PlatformException e) {
    switch (e.code) {
      case 'sign_in_failed':
        return BaseException(_ErrorCodes.signInFailed, I18n.current.sign_in_failed);
      case 'network_error':
        return BaseException(_ErrorCodes.networkError, I18n.current.network_error);
      default:
        return BaseException(
            _ErrorCodes.platformError, I18n.current.platform_error(e.message ?? ''));
    }
  }
}
