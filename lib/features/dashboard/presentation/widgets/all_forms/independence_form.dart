import 'package:flutter/material.dart';

class IndependenceForm extends StatefulWidget {
  const IndependenceForm({super.key});

  @override
  State<IndependenceForm> createState() => _IndependenceFormState();
}

class _IndependenceFormState extends State<IndependenceForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'IndependenceForm',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
