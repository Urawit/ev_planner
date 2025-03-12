import '../../../domain/entities/station_entity.dart';

abstract class StationDetailIDataSource {
  Future<StationEntity> getStationDetail({required String stationId});
}
