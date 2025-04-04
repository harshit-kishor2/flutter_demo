import 'package:flutter/material.dart';

class AgreeTermsForm extends StatefulWidget {
  const AgreeTermsForm({super.key});

  @override
  State<AgreeTermsForm> createState() => _AgreeTermsFormState();
}

class _AgreeTermsFormState extends State<AgreeTermsForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'Agree terms form',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
