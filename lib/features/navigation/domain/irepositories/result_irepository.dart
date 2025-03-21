import 'package:dartz/dartz.dart';

import '../../../../shared/exception/exception.dart';
import '../entities/result_input_entity.dart';

abstract class ResultIRepository {
  Future<Either<AnyException, int>> calculateResult(
      {required ResultInputEntity resultInput});
}
