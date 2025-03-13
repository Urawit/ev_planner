import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain.dart';

class SaveBookmarkUseCase {
  const SaveBookmarkUseCase({
    required SaveBookmarkIRepository repository,
  }) : _repository = repository;

  final SaveBookmarkIRepository _repository;

  Future<Either<AnyException, bool>> call(
      {required BookmarkInputEntity bookmarkInput}) {
    return _repository.saveBookmark(bookmarkInput: bookmarkInput);
  }
}
