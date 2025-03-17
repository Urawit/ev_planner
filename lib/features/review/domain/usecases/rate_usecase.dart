import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../domain.dart';

class RateUseCase {
  const RateUseCase({
    required RateIRepository repository,
  }) : _repository = repository;

  final RateIRepository _repository;

  Future<Either<AnyException, void>> call(
      {required RateInputEntity rateInput}) {
    return _repository.rate(rateInput: rateInput);
  }
}
