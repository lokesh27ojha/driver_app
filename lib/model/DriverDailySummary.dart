class DriverDailySummary {

  int? summaryId;
  final int driverId;
  final String date;
  final int trips;
  final int earning;
  final int totalKms;

  DriverDailySummary({
    required this.driverId,
    required this.date,
    required this.trips,
    required this.earning,
    required this.totalKms,
  });

}