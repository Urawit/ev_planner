import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/domain.dart';
import '../data.dart';

class DeleteReviewRepository implements DeleteReviewIRepository {
  const DeleteReviewRepository({required this.remoteDataSource});
  final DeleteReviewIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, void>> deleteReview(
      {required String reviewId}) async {
    try {
      final result = await remoteDataSource.deleteReview(reviewId: reviewId);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
