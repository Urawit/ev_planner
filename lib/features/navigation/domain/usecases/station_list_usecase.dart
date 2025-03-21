import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../domain.dart';

class StationListUseCase {
  const StationListUseCase({
    required StationListIRepository repository,
  }) : _repository = repository;

  final StationListIRepository _repository;

  Future<Either<AnyException, List<StationEntity>>> call() {
    return _repository.getStationList();
  }
}
