import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/domain.dart';
import '../data.dart';

class VehicleRepository implements VehicleIRepository {
  const VehicleRepository({required this.remoteDataSource});
  final VehicleIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, List<VehicleEntity>>> getVehicle() async {
    try {
      final result = await remoteDataSource.getVehicle();
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
