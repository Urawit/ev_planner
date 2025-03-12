import 'package:dartz/dartz.dart';

import '../../../../../shared/exception/exception.dart';
import '../../entities/station_entity.dart';

abstract class StationDetailIRepository {
  Future<Either<AnyException, StationEntity>> getStationDetail(
      {required String stationId});
}
