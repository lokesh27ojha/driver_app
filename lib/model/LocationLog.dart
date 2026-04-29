
class LocationLog{

  int? locationId;
  final int driverId;
  final int latitude;
  final int longitude;
  final int speed;
  final String heading;
  final String timeStamp;

  LocationLog({
    required this.driverId,
    required this.latitude,
    required this.longitude,
    required this.speed,
    required this.heading,
    required this.timeStamp
  });


}