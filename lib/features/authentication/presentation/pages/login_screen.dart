import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:person_plan/core/constants/enum.dart';
import 'package:person_plan/core/constants/image_const.dart';
import 'package:person_plan/core/helper/event_state.dart';
import 'package:person_plan/core/helper/utils.dart';
import 'package:person_plan/core/ui/full_screen_loader.dart';
import 'package:person_plan/core/ui/social_button.dart';
import 'package:person_plan/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:person_plan/routes/route_const.dart';

/// A screen that provides options for user authentication via social login providers.
///
/// This widget displays a login interface with buttons for Google and Apple authentication
/// (Apple button shown only on iOS/macOS platforms). It integrates with the AuthenticationBloc
/// for state management and navigation.
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //
  /// Initiates the Google authentication process.
  ///
  /// Triggers the [GoogleLoginEvent] in the [AuthenticationBloc] to handle
  /// Google sign-in flow.
  void _handleGoogleLogin() {
    context.read<AuthenticationBloc>().add(GoogleLoginEvent());
  }

  /// Initiates the Apple authentication process.
  ///
  /// Triggers the [AppleLoginEvent] in the [AuthenticationBloc] to handle
  /// Apple sign-in flow. Only applicable on iOS and macOS platforms.
  void _handleAppleLogin() {
    context.read<AuthenticationBloc>().add(AppleLoginEvent());
  }

  /// Listens to changes in the [AuthenticationState] and reacts accordingly.
  ///
  /// Navigates to the home screen on successful login or displays an error
  /// message if the login attempt fails.
  void _authenticationBlocListener(BuildContext context, AuthenticationState authState) async {
    if (authState.loginEventState is EventSuccess) {
      context.go(RouteConst.home);
    } else if (authState.loginEventState is EventFailedWithMessage) {
      final errorState = authState.loginEventState as EventFailedWithMessage;
      Utils.showSnackBar(context, errorState.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: _authenticationBlocListener,
        builder: (authContext, authState) {
          return FullScreenLoader(
            loading: authState.loginEventState is EventPending,
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildAppLogo(),
                      const SizedBox(height: 60),
                      _buildGoogleLoginButton(),
                      const SizedBox(height: 20),
                      _buildAppleLoginButton(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAppLogo() {
    return const CircleAvatar(
      radius: 100,
      backgroundImage: AssetImage(ImageConst.appIcon),
      backgroundColor: Colors.transparent,
    );
  }

  /// Builds the Google login button widget.
  Widget _buildGoogleLoginButton() {
    return SocialButton(
      type: SocialLoginType.google,
      onTap: _handleGoogleLogin,
    );
  }

  /// Builds the Apple login button widget.
  Widget _buildAppleLoginButton() {
    if (Platform.isIOS || Platform.isMacOS) {
      return SocialButton(
        type: SocialLoginType.apple,
        onTap: _handleAppleLogin,
      );
    }
    return const SizedBox.shrink();
  }
}
