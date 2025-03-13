import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../../domain/domain.dart';
import '../../data.dart';

class SaveBookmarkRepository implements SaveBookmarkIRepository {
  const SaveBookmarkRepository({required this.remoteDataSource});
  final SaveBookmarkIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, bool>> saveBookmark(
      {required BookmarkInputEntity bookmarkInput}) async {
    try {
      final result =
          await remoteDataSource.saveBookmark(bookmarkInput: bookmarkInput);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
