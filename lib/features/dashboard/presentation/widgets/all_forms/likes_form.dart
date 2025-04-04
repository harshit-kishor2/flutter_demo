import 'package:flutter/material.dart';

class LikesForm extends StatefulWidget {
  const LikesForm({super.key});

  @override
  State<LikesForm> createState() => _LikesFormState();
}

class _LikesFormState extends State<LikesForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'LikesForm',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
