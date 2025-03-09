import '../../domain/entities/station_entity.dart';

abstract class StationIDataSource {
  Future<List<StationEntity>> getStationList();
}
