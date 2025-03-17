import 'package:dartz/dartz.dart';

import '../../../../shared/exception/exception.dart';
import '../entities/post_review_input_entity.dart';

abstract class PostReviewIRepository {
  Future<Either<AnyException, void>> postReview(
      {required PostReviewInputEntity postReviewInput});
}
