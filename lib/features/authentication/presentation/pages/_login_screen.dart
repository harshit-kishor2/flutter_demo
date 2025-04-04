import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:person_plan/core/constants/enum.dart';
import 'package:person_plan/core/helper/logger.dart';
import 'package:person_plan/core/helper/utils.dart';
import 'package:person_plan/core/i18n/l10n.dart';
import 'package:person_plan/core/ui/app_button.dart';
import 'package:person_plan/core/ui/or_divider.dart';
import 'package:person_plan/core/ui/social_button.dart';
import 'package:person_plan/features/authentication/presentation/widgets/auth_text_row.dart';
import 'package:person_plan/features/authentication/presentation/widgets/input_fields.dart';
import 'package:person_plan/features/authentication/presentation/widgets/form_header.dart';
import 'package:person_plan/routes/route_const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onSubmitForm() {
    if (_formKey.currentState!.validate()) {
      final String email = _emailController.text;
      final String password = _passwordController.text;
      printInfo('Email: $email, Password: $password');
      // Add your authentication logic here
      context.go(RouteConst.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => Utils.dismissKeyboard(context),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.1),
                FormHeader(I18n.of(context).login_title),
                SizedBox(height: size.height * 0.05),
                _buildSocialAuthButtons(context),
                const OrDivider(
                  verticalPadding: 32.0,
                ),
                _buildLoginForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialAuthButtons(BuildContext context) {
    return Column(
      children: [
        SocialButton(
          type: SocialLoginType.google,
          onTap: () {},
        ),
        const SizedBox(height: 16.0),
        SocialButton(
          type: SocialLoginType.apple,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailInputField(emailController: _emailController),
          const SizedBox(height: 16.0),
          PasswordInputField(passwordController: _passwordController),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: AppButton(onTap: _onSubmitForm, text: "Log In"),
          ),
          const SizedBox(height: 16.0),
          AuthTextRow(
            mainText: I18n.of(context).login_auth_row_text,
            actionText: I18n.of(context).signup_button,
            onActionPressed: () {
              context.go(RouteConst.register);
            },
          ),
        ],
      ),
    );
  }

  // End
}
