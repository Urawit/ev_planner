import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../entities/bookmark_entity.dart';
import '../irepositories/get_bookmark_list_irepository.dart';

class GetBookmarkListUseCase {
  const GetBookmarkListUseCase({
    required GetBookmarkListIRepository repository,
  }) : _repository = repository;

  final GetBookmarkListIRepository _repository;

  Future<Either<AnyException, List<BookmarkEntity>>> call(
      {required String userId}) {
    return _repository.getBookmarkList(userId: userId);
  }
}
