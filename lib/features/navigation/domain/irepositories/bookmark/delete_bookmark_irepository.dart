import 'package:dartz/dartz.dart';

import '../../../../../shared/exception/exception.dart';

abstract class DeleteBookmarkIRepository {
  Future<Either<AnyException, bool>> deleteBookmark(
      {required String bookmarkId});
}
