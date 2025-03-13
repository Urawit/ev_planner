import 'package:dartz/dartz.dart';

import '../../../../shared/exception/exception.dart';
import '../../domain/entities/bookmark_entity.dart';
import '../../domain/irepositories/get_bookmark_list_irepository.dart';
import '../datasources/get_bookmark_list_idatasource.dart';

class GetBookmarkListRepository implements GetBookmarkListIRepository {
  const GetBookmarkListRepository({required this.remoteDataSource});
  final GetBookmarkListIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, List<BookmarkEntity>>> getBookmarkList(
      {required String userId}) async {
    try {
      final result = await remoteDataSource.getBookmarkList(userId: userId);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
