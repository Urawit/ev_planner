import 'package:dartz/dartz.dart';

import '../../../../shared/exception/exception.dart';
import '../entities/get_result_entity.dart';

abstract class GetResultIRepository {
  Future<Either<AnyException, GetResultEntity>> getResult(
      {required int resultId});
}
