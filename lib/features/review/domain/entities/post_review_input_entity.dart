abstract class PostReviewInputEntity {
  const PostReviewInputEntity(
      {required this.stationId, required this.userId, required this.comment});

  final String stationId;
  final String userId;
  final String comment;
}
