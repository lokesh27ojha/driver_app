import 'package:flutter/material.dart';

class ProfileHistoryCard extends StatelessWidget {
  final VoidCallback onTap;

  const ProfileHistoryCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: CircleAvatar(
            backgroundColor: Colors.deepPurple.shade50,
            child: const Icon(Icons.history, color: Colors.deepPurple),
          ),
          title: const Text(
            "Trip History",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text("View all past trips & earnings"),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: onTap,
        ),
      ),
    );
  }
}