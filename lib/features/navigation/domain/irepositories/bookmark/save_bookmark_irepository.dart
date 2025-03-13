import 'package:dartz/dartz.dart';

import '../../../../../shared/exception/exception.dart';
import '../../entities/bookmark_input_entity.dart';

abstract class SaveBookmarkIRepository {
  Future<Either<AnyException, bool>> saveBookmark(
      {required BookmarkInputEntity bookmarkInput});
}
