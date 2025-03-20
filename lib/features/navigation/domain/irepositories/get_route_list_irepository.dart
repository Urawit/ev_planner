import 'package:dartz/dartz.dart';

import '../../../../shared/exception/exception.dart';
import '../entities/trip_result_entity.dart';

abstract class GetRouteListIRepository {
  Future<Either<AnyException, TripResultEntity>> getRouteList(
      {required int tripId});
}
