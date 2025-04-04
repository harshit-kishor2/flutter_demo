import 'package:flutter/material.dart';

class StrengthsForm extends StatefulWidget {
  const StrengthsForm({super.key});

  @override
  State<StrengthsForm> createState() => _StrengthsFormState();
}

class _StrengthsFormState extends State<StrengthsForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'StrengthsForm',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
