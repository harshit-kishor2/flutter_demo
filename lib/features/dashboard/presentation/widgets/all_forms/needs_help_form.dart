import 'package:flutter/material.dart';

class NeedsHelpForm extends StatefulWidget {
  const NeedsHelpForm({super.key});

  @override
  State<NeedsHelpForm> createState() => _NeedsHelpFormState();
}

class _NeedsHelpFormState extends State<NeedsHelpForm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'NeedsHelpForm',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
