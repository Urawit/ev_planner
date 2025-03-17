import '../../domain/entities/review_entity.dart';

class ReviewModel implements ReviewEntity {
  const ReviewModel(
      {required this.reviewId,
      required this.comment,
      required this.createDate,
      required this.userId,
      required this.stationId,
      required this.username});
  @override
  final String reviewId;
  @override
  final String comment;
  @override
  final String createDate;
  @override
  final String userId;
  @override
  final String stationId;
  @override
  final String username;
}
