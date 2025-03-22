import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/domain.dart';
import '../data.dart';

class GetResultRepository implements GetResultIRepository {
  const GetResultRepository({required this.remoteDataSource});
  final GetResultIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, GetResultEntity>> getResult(
      {required int resultId}) async {
    try {
      final result = await remoteDataSource.getResult(resultId: resultId);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
