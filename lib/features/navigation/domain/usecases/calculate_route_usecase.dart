import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../domain.dart';

class CalculateRouteUseCase {
  const CalculateRouteUseCase({
    required CalculateRouteIRepository repository,
  }) : _repository = repository;

  final CalculateRouteIRepository _repository;

  Future<Either<AnyException, int>> call(
      {required CalculateRouteInputEntity calculateRouteInput}) {
    return _repository.calculateRouteList(
        calculateRouteInput: calculateRouteInput);
  }
}
