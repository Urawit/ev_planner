import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/domain.dart';
import '../data.dart';

class StationRepository implements StationIRepository {
  const StationRepository({required this.remoteDataSource});
  final StationIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, List<StationEntity>>> getStationList() async {
    try {
      final result = await remoteDataSource.getStationList();
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
