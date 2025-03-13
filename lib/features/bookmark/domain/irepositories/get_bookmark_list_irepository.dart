import 'package:dartz/dartz.dart';

import '../../../../shared/exception/exception.dart';
import '../entities/bookmark_entity.dart';

abstract class GetBookmarkListIRepository {
  Future<Either<AnyException, List<BookmarkEntity>>> getBookmarkList(
      {required String userId});
}
