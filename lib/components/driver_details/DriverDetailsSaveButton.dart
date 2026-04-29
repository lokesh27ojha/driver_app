import 'package:flutter/material.dart';

class DriverDetailsSaveButton extends StatelessWidget {
  final VoidCallback onSave;

  const DriverDetailsSaveButton({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onSave,
          
          child: const Text("Save Changes"),
        ),
      ),
    );
  }
}