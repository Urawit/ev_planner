import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../domain.dart';

class DeleteReviewUseCase {
  const DeleteReviewUseCase({
    required DeleteReviewIRepository repository,
  }) : _repository = repository;

  final DeleteReviewIRepository _repository;

  Future<Either<AnyException, void>> call({required String reviewId}) {
    return _repository.deleteReview(reviewId: reviewId);
  }
}
