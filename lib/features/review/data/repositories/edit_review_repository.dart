import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/domain.dart';
import '../data.dart';

class EditReviewRepository implements EditReviewIRepository {
  const EditReviewRepository({required this.remoteDataSource});
  final EditReviewIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, void>> editReview(
      {required String reviewId, required String comment}) async {
    try {
      final result = await remoteDataSource.editReview(
          reviewId: reviewId, comment: comment);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
