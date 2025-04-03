import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:person_plan/core/constants/enum.dart';
import 'package:person_plan/core/constants/image_const.dart';
import 'package:person_plan/core/ui/social_button.dart';
import 'package:person_plan/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:person_plan/features/authentication/presentation/widgets/form_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// Handles the tap event on the "Log in with Google" button.
  ///
  /// Adds a [GoogleLoginEvent] to the [AuthenticationBloc] to trigger the
  /// authentication process with Google.
  void _onGoogleLoginPressed() {
    context.read<AuthenticationBloc>().add(GoogleLoginEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormHeader('Log In'),
                SizedBox(height: 60),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage(
                    ImageConst.appIcon,
                  ),
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(height: 60),
                SocialButton(
                  type: SocialLoginType.google,
                  onTap: _onGoogleLoginPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
