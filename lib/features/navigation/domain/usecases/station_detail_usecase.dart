import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../domain.dart';

class StationDetailUseCase {
  const StationDetailUseCase({
    required StationDetailIRepository repository,
  }) : _repository = repository;

  final StationDetailIRepository _repository;

  Future<Either<AnyException, StationEntity>> call(
      {required String stationId}) {
    return _repository.getStationDetail(stationId: stationId);
  }
}
