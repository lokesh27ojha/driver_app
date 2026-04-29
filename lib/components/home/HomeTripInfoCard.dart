import 'package:flutter/material.dart';

class HomeTripInfoCard extends StatelessWidget {
  const HomeTripInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.orange.shade100,
      width: double.infinity,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Active Trip"),
          Text("Port → Warehouse"),
          Text("20 km"),
        ],
      ),
    );
  }
}