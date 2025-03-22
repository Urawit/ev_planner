import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../domain.dart';

class GetResultUseCase {
  const GetResultUseCase({
    required GetResultIRepository repository,
  }) : _repository = repository;

  final GetResultIRepository _repository;

  Future<Either<AnyException, GetResultEntity>> call({required int resultId}) {
    return _repository.getResult(resultId: resultId);
  }
}
