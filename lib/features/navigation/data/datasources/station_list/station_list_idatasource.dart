import '../../../domain/entities/station_entity.dart';

abstract class StationListIDataSource {
  Future<List<StationEntity>> getStationList();
}
