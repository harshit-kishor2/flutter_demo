import 'package:flutter/material.dart';

class ActivitiesForm extends StatefulWidget {
  const ActivitiesForm({super.key});

  @override
  State<ActivitiesForm> createState() => _ActivitiesFormState();
}

class _ActivitiesFormState extends State<ActivitiesForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'ActivitiesForm',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
