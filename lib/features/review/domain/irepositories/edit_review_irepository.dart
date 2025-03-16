import 'package:dartz/dartz.dart';

import '../../../../shared/exception/exception.dart';

abstract class EditReviewIRepository {
  Future<Either<AnyException, void>> editReview(
      {required String reviewId, required String comment});
}
