import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:person_plan/core/constants/enum.dart';
import 'package:person_plan/core/helper/base_exception.dart';
import 'package:person_plan/core/helper/utils.dart';
import 'package:person_plan/features/authentication/data/models/user_model.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthRemoteDataSource {
  AuthRemoteDataSource({
    required GoogleSignIn googleSignIn,
    required FirebaseAuth firebaseAuth,
  })  : _googleSignIn = googleSignIn,
        _firebaseAuth = firebaseAuth;

  final GoogleSignIn _googleSignIn;
  final FirebaseAuth _firebaseAuth;
  static const String _appleProvider = 'apple.com';
  static const String _unknownUser = 'google.com';

  /// Signs in with Google.
  ///
  /// Returns a [UserModel] on success. Throws [BaseException] on failure.
  Future<UserModel> signInWithGoogle() async {
    try {
      // 1. Request Google sign in
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        throw BaseException.cancelled(SocialLoginType.google);
      }

      // 2. Get Google sign in authentication
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // 3. Check if the authentication was successful
      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        throw BaseException.tokenFailure(SocialLoginType.google);
      }

      // 4. Create a Firebase Auth credential from the Google authentication
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 5. Sign in with the credential
      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

      // 6. Get the user from the credential
      final User? user = userCredential.user;

      // 7. Check if the user is not null
      if (user == null) {
        throw BaseException.userDataFailure();
      }

      // 8. Return the user as a UserModel
      return UserModel(
        uid: user.uid,
        name: user.displayName ?? _unknownUser,
        email: user.email ?? '',
        photoUrl: user.photoURL ?? '',
      );
    } on FirebaseAuthException catch (e) {
      final exception = BaseException.fromFirebaseAuth(e);
      throw exception;
    } on PlatformException catch (e) {
      final exception = BaseException.fromPlatform(e);
      throw exception;
    } catch (e) {
      rethrow;
    }
  }

  /// Signs in with Apple.
  ///
  /// Returns a [UserModel] on success. Throws [BaseException] on failure.
  Future<UserModel> signInWithApple() async {
    try {
      // Generate a random nonce for security. This is sent to Apple and then
      // verified again after the sign-in process to ensure the request comes from
      // our app.
      final rawNonce = Utils.generateNonce();
      // final nonce = sha256.convert(utf8.encode(rawNonce)).toString();

      // Sign in with Apple.
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: rawNonce,
      );

      // Check if the identity token is null. This should never happen, but it's
      // better to be safe than sorry.
      if (appleCredential.identityToken == null) {
        throw BaseException.tokenFailure(SocialLoginType.apple);
      }

      // Create a credential from the Apple sign-in.
      final oauthCredential = OAuthProvider(_appleProvider).credential(
        // The identity token is the token that is used to verify the user.
        idToken: appleCredential.identityToken,
        // The nonce is the random value we generated earlier.
        rawNonce: rawNonce,
      );

      // Sign in with the credential.
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(oauthCredential);
      final User? user = userCredential.user;

      // Check if the user is null. This should never happen, but it's better to be
      // safe than sorry.
      if (user == null) {
        throw BaseException.userDataFailure();
      }

      // Apple might only provide name on first sign-in, so we need to handle this
      // case.
      final fullName = appleCredential.givenName != null && appleCredential.familyName != null
          ? '${appleCredential.givenName} ${appleCredential.familyName}'
          : user.displayName ?? _unknownUser;

      // Return the user as a UserModel.
      return UserModel(
        uid: user.uid,
        name: fullName,
        email: user.email ?? appleCredential.email ?? '',
        photoUrl: user.photoURL ?? '',
      );
    } on SignInWithAppleAuthorizationException catch (e) {
      throw BaseException(e.code.toString(), e.message);
    } on FirebaseAuthException catch (e) {
      final exception = BaseException.fromFirebaseAuth(e);
      throw exception;
    } on PlatformException catch (e) {
      final exception = BaseException.fromPlatform(e);
      throw exception;
    } catch (e) {
      rethrow;
    }
  }

  /// Signs out from all authentication services.
  ///
  /// This method signs out from both Google and Firebase.
  Future<void> signOut() async {
    try {
      await Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);
    } on FirebaseAuthException catch (e) {
      final exception = BaseException.fromFirebaseAuth(e);
      throw exception;
    } on PlatformException catch (e) {
      final exception = BaseException.fromPlatform(e);
      throw exception;
    } catch (e) {
      rethrow;
    }
  }
}
