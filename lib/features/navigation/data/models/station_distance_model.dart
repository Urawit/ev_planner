import '../../domain/entities/station_distance_entity.dart';

class StationDistanceModel implements StationDistanceEntity {
  const StationDistanceModel(
      {required this.stationId, required this.distanceFromStartToStation});
  @override
  final String stationId;
  @override
  final double distanceFromStartToStation;
}
