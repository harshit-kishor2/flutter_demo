import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget {
  final String title;
  const FormHeader(this.title, {super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text(
      title,
      style: textTheme.headlineMedium,
    );
  }
}
