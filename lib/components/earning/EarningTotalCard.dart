import 'package:flutter/material.dart';

class EarningTotalCard extends StatelessWidget {
  const EarningTotalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: const ListTile(
        title: Text("Total Earnings"),
        trailing: Text(
          "₹18,500",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}