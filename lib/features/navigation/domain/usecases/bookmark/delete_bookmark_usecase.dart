import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain.dart';

class DeleteBookmarkUseCase {
  const DeleteBookmarkUseCase({
    required DeleteBookmarkIRepository repository,
  }) : _repository = repository;

  final DeleteBookmarkIRepository _repository;

  Future<Either<AnyException, bool>> call({required String bookmarkId}) {
    return _repository.deleteBookmark(bookmarkId: bookmarkId);
  }
}
