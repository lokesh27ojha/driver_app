class RideRequestDetails {
  final String pickup;
  final String drop;
  final double distance;
  final int estimatedTime;
  final double fare;

  RideRequestDetails({
    required this.pickup,
    required this.drop,
    required this.distance,
    required this.estimatedTime,
    required this.fare,
  });
}