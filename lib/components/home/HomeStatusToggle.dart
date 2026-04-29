import 'package:driver_app/model/DriverState.dart';
import 'package:flutter/material.dart';


class HomeStatusToggle extends StatelessWidget {
  final DriverState status;
  final Function(bool) onToggle;
  final bool isEnabled;

  const HomeStatusToggle({
    super.key,
    required this.status,
    required this.onToggle,
    required this.isEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(status.name.toUpperCase().replaceAll("_", " ")),

          Switch(
            value: status != DriverState.OFFLINE,
            onChanged: isEnabled ? onToggle : null, // 🔥 disable here
          ),
        ],
      ),
    );
  }
}