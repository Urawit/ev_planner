import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../../domain/domain.dart';
import '../../data.dart';

class DeleteBookmarkRepository implements DeleteBookmarkIRepository {
  const DeleteBookmarkRepository({required this.remoteDataSource});
  final DeleteBookmarkIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, bool>> deleteBookmark(
      {required String bookmarkId}) async {
    try {
      final result =
          await remoteDataSource.deleteBookmark(bookmarkId: bookmarkId);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
