abstract class ReviewEntity {
  const ReviewEntity({
    required this.reviewId,
    required this.comment,
    required this.createDate,
    required this.userId,
    required this.stationId,
  });

  final String reviewId;
  final String comment;
  final String createDate;
  final String userId;
  final String stationId;
}
