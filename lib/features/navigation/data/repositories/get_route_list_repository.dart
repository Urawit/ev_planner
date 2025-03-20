import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/domain.dart';
import '../data.dart';

class GetRouteListRepository implements GetRouteListIRepository {
  const GetRouteListRepository({required this.remoteDataSource});
  final GetRouteListIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, TripResultEntity>> getRouteList(
      {required int tripId}) async {
    try {
      final result = await remoteDataSource.getRouteList(tripId: tripId);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
