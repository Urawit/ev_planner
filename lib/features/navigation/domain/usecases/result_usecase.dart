import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../domain.dart';

class ResultUseCase {
  const ResultUseCase({
    required ResultIRepository repository,
  }) : _repository = repository;

  final ResultIRepository _repository;

  Future<Either<AnyException, int>> call(
      {required ResultInputEntity resultInput}) {
    return _repository.calculateResult(resultInput: resultInput);
  }
}
