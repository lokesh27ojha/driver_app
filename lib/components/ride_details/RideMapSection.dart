import 'package:flutter/material.dart';
import 'package:driver_app/model/RideRequestDetails.dart';

class RideMapSection extends StatelessWidget {
  final RideRequestDetails ride;

  const RideMapSection({super.key, required this.ride});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade300,
      child: const Center(
        child: Text("Map with Pickup → Drop Route"),
      ),
    );
  }
}