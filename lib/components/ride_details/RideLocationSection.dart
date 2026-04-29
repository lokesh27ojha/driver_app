import 'package:driver_app/model/RideRequestDetails.dart';
import 'package:flutter/material.dart';


class RideLocationSection extends StatelessWidget {
  final RideRequestDetails ride;

  const RideLocationSection({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Pickup: ${ride.pickup}"),
          const SizedBox(height: 6),
          Text("Drop: ${ride.drop}"),
        ],
      ),
    );
  }
}