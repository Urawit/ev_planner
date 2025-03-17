import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/domain.dart';
import '../data.dart';

class PostReviewRepository implements PostReviewIRepository {
  const PostReviewRepository({required this.remoteDataSource});
  final PostReviewIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, void>> postReview(
      {required PostReviewInputEntity postReviewInput}) async {
    try {
      final result =
          await remoteDataSource.postReview(postReviewInput: postReviewInput);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
