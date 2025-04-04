import 'package:flutter/material.dart';

class ChallengesForm extends StatefulWidget {
  const ChallengesForm({super.key});

  @override
  State<ChallengesForm> createState() => _ChallengesFormState();
}

class _ChallengesFormState extends State<ChallengesForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'ChallengesForm',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
