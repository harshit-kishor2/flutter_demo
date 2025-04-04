import 'package:flutter/material.dart';

class DislikesForm extends StatefulWidget {
  const DislikesForm({super.key});

  @override
  State<DislikesForm> createState() => _DislikesFormState();
}

class _DislikesFormState extends State<DislikesForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'DislikesForm',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
