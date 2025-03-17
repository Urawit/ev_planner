import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/domain.dart';
import '../data.dart';

class RateRepository implements RateIRepository {
  const RateRepository({required this.remoteDataSource});
  final RateIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, void>> rate(
      {required RateInputEntity rateInput}) async {
    try {
      final result = await remoteDataSource.rate(rateInput: rateInput);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
