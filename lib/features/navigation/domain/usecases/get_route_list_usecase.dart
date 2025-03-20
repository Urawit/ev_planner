import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../domain.dart';

class GetRouteListUseCase {
  const GetRouteListUseCase({
    required GetRouteListIRepository repository,
  }) : _repository = repository;

  final GetRouteListIRepository _repository;

  Future<Either<AnyException, TripResultEntity>> call({required int tripId}) {
    return _repository.getRouteList(tripId: tripId);
  }
}
