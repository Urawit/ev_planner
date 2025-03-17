import '../../domain/entities/post_review_input_entity.dart';

abstract class PostReviewIDataSource {
  Future<void> postReview({required PostReviewInputEntity postReviewInput});
}
