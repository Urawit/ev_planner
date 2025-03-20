import 'route_entity.dart';

abstract class TripResultEntity {
  const TripResultEntity(
      {required this.tripId,
      required this.currentBattery,
      required this.routeList});

  final int tripId;
  final int currentBattery;
  final List<RouteEntity> routeList;
}
