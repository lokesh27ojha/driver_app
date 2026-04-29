import 'package:flutter/material.dart';
import 'package:driver_app/model/RideRequestDetails.dart';

class RideStatsSection extends StatelessWidget {
  final RideRequestDetails ride;

  const RideStatsSection({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          Column(
            children: [
              const Text("Distance"),
              Text("${ride.distance} km"),
            ],
          ),

          Column(
            children: [
              const Text("Time"),
              Text("${ride.estimatedTime}"),
            ],
          ),

          Column(
            children: [
              const Text("Earning"),
              Text("₹${ride.fare}"),
            ],
          ),
        ],
      ),
    );
  }
}