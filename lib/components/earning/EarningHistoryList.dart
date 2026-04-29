import 'package:flutter/material.dart';

class EarningsHistoryList extends StatelessWidget {
  const EarningsHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(

            // 🔹 LEFT SIDE DETAILS
            title: Text("Port A → Warehouse B"),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("12 Apr 2026"),
                Text("25 km"),
              ],
            ),

            // 🔹 RIGHT SIDE (EARNING)
            trailing: const Text(
              "₹500",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
        );
      },
    );
  }
}