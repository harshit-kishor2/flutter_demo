import 'package:flutter/material.dart';
import 'package:person_plan/core/helper/extensions.dart';
import 'package:person_plan/core/i18n/l10n.dart';

// ! Email Input Fields
class EmailInputField extends StatelessWidget {
  const EmailInputField({super.key, required this.emailController});

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: I18n.of(context).email_hint,
        prefixIcon: const Icon(Icons.email_outlined),
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
  const PasswordInputField({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      obscureText: true,
      decoration: InputDecoration(
        hintText: I18n.of(context).password_hint,
        prefixIcon: const Icon(Icons.lock_outline),
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
  const NameInputField({super.key, required this.nameController});

  final TextEditingController nameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: nameController,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      obscureText: true,
      decoration: InputDecoration(
        hintText: I18n.of(context).name_hint,
        prefixIcon: const Icon(Icons.lock_outline),
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
