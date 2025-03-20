import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/domain.dart';
import '../data.dart';

class CalculateRouteRepository implements CalculateRouteIRepository {
  const CalculateRouteRepository({required this.remoteDataSource});
  final CalculateRouteIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, int>> calculateRouteList(
      {required CalculateRouteInputEntity calculateRouteInput}) async {
    try {
      final result = await remoteDataSource.calculateRouteList(
          calculateRouteInput: calculateRouteInput);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
