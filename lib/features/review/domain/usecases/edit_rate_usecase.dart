import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../domain.dart';

class EditRateUseCase {
  const EditRateUseCase({
    required EditRateIRepository repository,
  }) : _repository = repository;

  final EditRateIRepository _repository;

  Future<Either<AnyException, void>> call(
      {required RateInputEntity rateInput}) {
    return _repository.editRate(rateInput: rateInput);
  }
}
