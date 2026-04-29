class DriverTruckMapping{

  int? mappingId;
  final int truckId;
  final int driverId;
  final int assignedAt;

  DriverTruckMapping({
    required this.truckId,
    required this.driverId,
    required this.assignedAt
  });

}