import 'package:flutter/material.dart';

class BioInfoForm extends StatefulWidget {
  const BioInfoForm({super.key});

  @override
  State<BioInfoForm> createState() => _BioInfoFormState();
}

class _BioInfoFormState extends State<BioInfoForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'BioInfoForm',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
