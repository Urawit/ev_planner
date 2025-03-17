import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../domain.dart';

class PostReviewUseCase {
  const PostReviewUseCase({
    required PostReviewIRepository repository,
  }) : _repository = repository;

  final PostReviewIRepository _repository;

  Future<Either<AnyException, void>> call(
      {required PostReviewInputEntity postReviewInput}) {
    return _repository.postReview(postReviewInput: postReviewInput);
  }
}
