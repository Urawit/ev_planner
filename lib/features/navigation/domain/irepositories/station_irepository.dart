import 'package:dartz/dartz.dart';

import '../../../../shared/exception/exception.dart';
import '../entities/station_entity.dart';

abstract class StationIRepository {
  Future<Either<AnyException, List<StationEntity>>> getStationList();
}
