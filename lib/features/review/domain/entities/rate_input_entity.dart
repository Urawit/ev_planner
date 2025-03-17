abstract class RateInputEntity {
  const RateInputEntity(
      {required this.stationId, required this.userId, required this.rating});

  final String stationId;
  final String userId;
  final double rating;
}
