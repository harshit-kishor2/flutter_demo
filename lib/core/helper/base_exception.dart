import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class BaseException implements Exception {
  final String code;
  final String message;

  BaseException(this.code, this.message);

  @override
  String toString() => '[$code] $message';

  // Predefined exception creators

  static BaseException cancelled(String method) =>
      BaseException('AUTH_CANCELLED', 'You cancelled the $method Sign-In process');

  static BaseException tokenFailure(String method) =>
      BaseException('TOKEN_ERROR', 'Unable to obtain $method authentication tokens');

  static BaseException userDataFailure() =>
      BaseException('USER_DATA_ERROR', 'Unable to retrieve your account information');
  static BaseException networkError() =>
      BaseException('NETWORK_ERROR', 'Please check your internet connection');

  static BaseException unexpected(String methodName) =>
      BaseException('UNEXPECTED_ERROR', 'Unexpected error during $methodName: Please try again');

  static BaseException fromFirebaseAuth(FirebaseAuthException e) {
    switch (e.code) {
      case 'account-exists-with-different-credential':
        return BaseException(
            'ACCOUNT_CONFLICT', 'This account is already linked with a different sign-in method');
      case 'invalid-credential':
        return BaseException(
            'INVALID_CREDENTIALS', 'Invalid credentials: Please check your account details');
      case 'operation-not-allowed':
        return BaseException(
            'METHOD_NOT_ALLOWED', 'This sign-in method is not enabled for this app');
      case 'user-disabled':
        return BaseException('USER_DISABLED', 'Your account has been disabled');
      case 'user-not-found':
        return BaseException('USER_NOT_FOUND', 'No account found with these credentials');
      case 'wrong-password':
        return BaseException('WRONG_PASSWORD', 'Incorrect password');
      case 'too-many-requests':
        return BaseException('TOO_MANY_REQUESTS', 'Too many attempts: Please try again later');
      case 'network-request-failed':
        return BaseException(
            'NETWORK_ERROR', 'Network error: Please check your internet connection');
      default:
        return BaseException(
            'FIREBASE_ERROR', 'Sign-in failed: ${e.message ?? 'An unexpected error occurred'}');
    }
  }

  static BaseException fromPlatform(PlatformException e) {
    switch (e.code) {
      case 'sign_in_failed':
        return BaseException('SIGN_IN_FAILED', 'Sign-in failed: Please try again');
      case 'network_error':
        return BaseException(
            'NETWORK_ERROR', 'Network error: Please check your internet connection');
      default:
        return BaseException(
            'PLATFORM_ERROR', 'Platform error: ${e.message ?? 'An unexpected error occurred'}');
    }
  }
}
