import 'package:dartz/dartz.dart';

import '../../../../shared/exception/exception.dart';

abstract class DeleteReviewIRepository {
  Future<Either<AnyException, void>> deleteReview({required String reviewId});
}
