class Transaction {

  int? transactionId;
  final int driverId;
  final int tripId;
  final int amount;
  final int tip;
  final int totalAmount;
  final String createdAt;

  Transaction({
    required this.driverId,
    required this.tripId,
    required this.amount,
    required this.tip,
    required this.totalAmount,
    required this.createdAt
  });

}