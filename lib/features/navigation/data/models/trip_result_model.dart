import '../../domain/entities/entities.dart';

class TripResultModel implements TripResultEntity {
  const TripResultModel(
      {required this.tripId,
      required this.currentBattery,
      required this.routeList});

  @override
  final int tripId;
  @override
  final int currentBattery;
  @override
  final List<RouteEntity> routeList;
}
