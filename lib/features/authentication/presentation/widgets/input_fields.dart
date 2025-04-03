import 'package:flutter/material.dart';
import 'package:person_plan/core/helper/extensions.dart';
import 'package:person_plan/core/i18n/l10n.dart';

// ! Email Input Fields
class EmailInputField extends StatelessWidget {
  final TextEditingController emailController;
  const EmailInputField({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: I18n.of(context).email_hint,
        prefixIcon: Icon(Icons.email_outlined),
      ),
      validator: (value) {
        if (value.isEmptyOrNull) {
          return I18n.of(context).email_error_empty;
        }
        if (!value.isValidEmail) {
          return I18n.of(context).email_error_invalid;
        }
        return null;
      },
    );
  }
}

// ! Password Input Fields

class PasswordInputField extends StatelessWidget {
  final TextEditingController passwordController;
  const PasswordInputField({super.key, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      obscureText: true,
      decoration: InputDecoration(
        hintText: I18n.of(context).password_hint,
        prefixIcon: Icon(Icons.lock_outline),
      ),
      validator: (value) {
        if (value.isEmptyOrNull) {
          return I18n.of(context).password_error_empty;
        } else if (value!.length < 6) {
          return I18n.of(context).password_error_short;
        }
        return null;
      },
    );
  }
}

// ! Name Input Fields

class NameInputField extends StatelessWidget {
  final TextEditingController nameController;
  const NameInputField({super.key, required this.nameController});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      obscureText: true,
      decoration: InputDecoration(
        hintText: I18n.of(context).name_hint,
        prefixIcon: Icon(Icons.lock_outline),
      ),
      validator: (value) {
        if (value.isEmptyOrNull) {
          return I18n.of(context).name_error_empty;
        } else if (value!.length < 6) {
          return I18n.of(context).name_error_short;
        }
        return null;
      },
    );
  }
}
