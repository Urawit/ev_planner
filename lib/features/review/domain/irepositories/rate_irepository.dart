import 'package:dartz/dartz.dart';

import '../../../../shared/exception/exception.dart';
import '../entities/rate_input_entity.dart';

abstract class RateIRepository {
  Future<Either<AnyException, void>> rate({required RateInputEntity rateInput});
}
