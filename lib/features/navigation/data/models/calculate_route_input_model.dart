import '../../domain/entities/calculate_route_input_entity.dart';
import '../../domain/entities/station_distance_entity.dart';

class CalculateRouteInputModel implements CalculateRouteInputEntity {
  const CalculateRouteInputModel({
    required this.modelId,
    required this.totalDistance,
    required this.currentBattery,
    required this.distanceList,
  });
  @override
  final String modelId;
  @override
  final double totalDistance;
  @override
  final int currentBattery;
  @override
  final List<StationDistanceEntity> distanceList;
}
