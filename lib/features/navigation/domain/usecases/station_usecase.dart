import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../domain.dart';

class StationUseCase {
  const StationUseCase({
    required StationIRepository repository,
  }) : _repository = repository;

  final StationIRepository _repository;

  Future<Either<AnyException, List<StationEntity>>> call() {
    return _repository.getStationList();
  }
}
