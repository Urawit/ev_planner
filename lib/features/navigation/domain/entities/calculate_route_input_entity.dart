import 'station_distance_entity.dart';

abstract class CalculateRouteInputEntity {
  const CalculateRouteInputEntity({
    required this.modelId,
    required this.totalDistance,
    required this.currentBattery,
    required this.distanceList,
  });
  final String modelId;
  final double totalDistance;
  final int currentBattery;
  final List<StationDistanceEntity> distanceList;
}
