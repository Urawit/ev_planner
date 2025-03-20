import '../../domain/entities/entities.dart';

class RouteModel implements RouteEntity {
  const RouteModel(
      {required this.routeId,
      required this.chargingInfoList,
      required this.remainingBatteryAtDestination});

  @override
  final int routeId;
  @override
  final List<ChargingInfoEntity> chargingInfoList;
  @override
  final double remainingBatteryAtDestination;
}
