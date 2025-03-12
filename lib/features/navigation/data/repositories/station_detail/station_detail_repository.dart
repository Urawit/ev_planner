import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../../domain/domain.dart';
import '../../data.dart';

class StationDetailRepository implements StationDetailIRepository {
  const StationDetailRepository({required this.remoteDataSource});
  final StationDetailIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, StationEntity>> getStationDetail(
      {required String stationId}) async {
    try {
      final result =
          await remoteDataSource.getStationDetail(stationId: stationId);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
