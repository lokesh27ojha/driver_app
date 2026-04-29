import 'package:driver_app/model/Address.dart';
import 'package:driver_app/model/RideRequestState.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideRequest {
  int? rideRequestId;
  Address pickupAddress;
  final String pickupLocation;
  Address dropAddress;
  final String dropLocation;
  final double distance;
  final int eta;
  final double fare;
  RideRequestState status;

  RideRequest({
    this.rideRequestId,
    required this.pickupAddress,
    required this.pickupLocation,
    required this.dropAddress,
    required this.dropLocation,
    required this.distance,
    required this.eta,
    required this.fare,
    this.status=RideRequestState.PENDING,
  });
}