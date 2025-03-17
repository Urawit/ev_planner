import '../../domain/entities/post_review_input_entity.dart';

class PostReviewInputModel implements PostReviewInputEntity {
  const PostReviewInputModel(
      {required this.stationId, required this.userId, required this.comment});
  @override
  final String stationId;
  @override
  final String userId;
  @override
  final String comment;
}
