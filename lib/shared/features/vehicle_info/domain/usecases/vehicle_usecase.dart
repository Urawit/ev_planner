import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../domain.dart';

class VehicleUseCase {
  const VehicleUseCase({
    required VehicleIRepository repository,
  }) : _repository = repository;

  final VehicleIRepository _repository;

  Future<Either<AnyException, List<VehicleEntity>>> call() {
    return _repository.getVehicle();
  }
}
