abstract class RatingEntity {
  const RatingEntity({
    required this.ratingId,
    required this.rating,
    required this.userId,
  });

  final String ratingId;
  final String rating;
  final String userId;
}
