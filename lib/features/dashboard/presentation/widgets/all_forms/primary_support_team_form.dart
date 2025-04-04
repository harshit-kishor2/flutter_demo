import 'package:flutter/material.dart';

class PrimarySupportTeamForm extends StatefulWidget {
  const PrimarySupportTeamForm({super.key});

  @override
  State<PrimarySupportTeamForm> createState() => _PrimarySupportTeamFormState();
}

class _PrimarySupportTeamFormState extends State<PrimarySupportTeamForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'PrimarySupportTeamForm',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
