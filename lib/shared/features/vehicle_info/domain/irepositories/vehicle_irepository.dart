import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../entities/vehicle_entity.dart';

abstract class VehicleIRepository {
  Future<Either<AnyException, List<VehicleEntity>>> getVehicle();
}
