import 'package:dartz/dartz.dart';

import '../../../../shared/exception/exception.dart';
import '../entities/calculate_route_input_entity.dart';

abstract class CalculateRouteIRepository {
  Future<Either<AnyException, int>> calculateRouteList(
      {required CalculateRouteInputEntity calculateRouteInput});
}
