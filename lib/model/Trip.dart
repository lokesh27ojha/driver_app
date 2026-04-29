import 'package:driver_app/model/Address.dart';

class Trip{

  int? tripId;
  final int driverId;
  final int truckId;
  final Address pickupAddress;
  final Address dropAddress;
  final int distance;
  final String status;
  final String startTime;
  final String endTime;

  Trip({
    required this.driverId,
    required this.truckId,
    required this.pickupAddress,
    required this.dropAddress,
    required this.distance,
    required this.status,
    required this.startTime,
    required this.endTime
  });

}