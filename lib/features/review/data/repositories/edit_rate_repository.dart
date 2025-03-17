import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/domain.dart';
import '../data.dart';

class EditRateRepository implements EditRateIRepository {
  const EditRateRepository({required this.remoteDataSource});
  final EditRateIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, void>> editRate(
      {required RateInputEntity rateInput}) async {
    try {
      final result = await remoteDataSource.editRate(rateInput: rateInput);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
