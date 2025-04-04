import 'package:flutter/material.dart';

class DreamsForm extends StatefulWidget {
  const DreamsForm({super.key});

  @override
  State<DreamsForm> createState() => _DreamsFormState();
}

class _DreamsFormState extends State<DreamsForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'DreamsForm',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
