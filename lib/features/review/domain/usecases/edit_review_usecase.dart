import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../domain.dart';

class EditReviewUseCase {
  const EditReviewUseCase({
    required EditReviewIRepository repository,
  }) : _repository = repository;

  final EditReviewIRepository _repository;

  Future<Either<AnyException, void>> call(
      {required String reviewId, required String comment}) {
    return _repository.editReview(reviewId: reviewId, comment: comment);
  }
}
