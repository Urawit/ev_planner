import 'package:dartz/dartz.dart';

import '../../../../shared/exception/exception.dart';
import '../entities/rate_input_entity.dart';

abstract class EditRateIRepository {
  Future<Either<AnyException, void>> editRate(
      {required RateInputEntity rateInput});
}
