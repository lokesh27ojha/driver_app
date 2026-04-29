class Rating{

  int? ratingId;
  final int tripId;
  final int driverId;
  final int rating;
  final String review;
  final String createdAt;

  Rating({
    required this.tripId,
    required this.driverId,
    required this.rating,
    required this.review,
    required this.createdAt
  });

}