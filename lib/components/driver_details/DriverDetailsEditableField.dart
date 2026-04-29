import 'package:flutter/material.dart';

class DriverDetailsEditableField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isEditing;

  const DriverDetailsEditableField({
    super.key,
    required this.label,
    required this.controller,
    required this.isEditing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: isEditing
          ? TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
              ),
            )
          : ListTile(
              title: Text(label),
              subtitle: Text(controller.text),
            ),
    );
  }
}