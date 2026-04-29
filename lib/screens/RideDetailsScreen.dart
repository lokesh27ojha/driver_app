import 'package:driver_app/components/ride_details/RideActionButtons.dart';
import 'package:driver_app/components/ride_details/RideLocationSection.dart';
import 'package:driver_app/components/ride_details/RideMapSection.dart';
import 'package:driver_app/components/ride_details/RideStatsSection.dart';
import 'package:driver_app/model/RideRequestDetails.dart';
import 'package:flutter/material.dart';


class RideDetailsScreen extends StatelessWidget {
  final RideRequestDetails ride;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const RideDetailsScreen({
    super.key,
    required this.ride,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ride Details")),

      body: Column(
        children: [

          RideLocationSection(ride: ride),

          RideStatsSection(ride: ride),

          Expanded(
            child: RideMapSection(ride: ride),
          ),

          RideActionButtons(
            onAccept: () {
              onAccept();
              Navigator.pop(context);
            },
            onReject: () {
              onReject();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}