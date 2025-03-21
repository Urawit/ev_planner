import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/domain.dart';
import '../data.dart';

class ResultRepository implements ResultIRepository {
  const ResultRepository({required this.remoteDataSource});
  final ResultIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, int>> calculateResult(
      {required ResultInputEntity resultInput}) async {
    try {
      final result =
          await remoteDataSource.calculateResult(resultInput: resultInput);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
