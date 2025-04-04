import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  const FormHeader(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      title,
      style: textTheme.headlineMedium,
    );
  }
}
