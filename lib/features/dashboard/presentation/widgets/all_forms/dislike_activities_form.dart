import 'package:flutter/material.dart';

class DislikeActivitiesForm extends StatefulWidget {
  const DislikeActivitiesForm({super.key});

  @override
  State<DislikeActivitiesForm> createState() => _DislikeActivitiesFormState();
}

class _DislikeActivitiesFormState extends State<DislikeActivitiesForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'DislikeActivitiesForm',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
