abstract class StationDistanceEntity {
  const StationDistanceEntity(
      {required this.stationId, required this.distanceFromStartToStation});
  final String stationId;
  final double distanceFromStartToStation;
}
