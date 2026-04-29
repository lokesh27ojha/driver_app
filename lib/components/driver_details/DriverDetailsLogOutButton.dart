import 'package:driver_app/service/AppStateService.dart';
import 'package:flutter/material.dart';
import 'package:driver_app/service/SessionService.dart';

class DriverDetailsLogOutButton extends StatelessWidget {
  const DriverDetailsLogOutButton({super.key});

  

  Future<void> _confirmLogout(BuildContext context) async {
  final confirm = await showDialog<bool>(
    context: context,
    builder: (_) => AlertDialog(
      title: const Text("Logout"),
      content: const Text("Are you sure you want to logout?"),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true), // ✅ FIX
          child: const Text("Logout"),
        ),
      ],
    ),
  );

  if (confirm == true) {
    await _handleLogout(context);
  }
}

    Future<void> _handleLogout(BuildContext context) async {
  final sessionService = SessionService();

  await sessionService.logout();

  // 🔥 clear app state
  AppStateService.clearDriver();
  AppStateService.clearRequest();

  Navigator.pushNamedAndRemoveUntil(
    context,
    "/login",
    (route) => false,
  );
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade600,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 2,
          ),
          icon: const Icon(Icons.logout),
          label: const Text(
            "Logout",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () => _confirmLogout(context),
        ),
      ),
    );
  }
}