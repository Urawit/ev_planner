import 'charging_info_entity.dart';

abstract class RouteEntity {
  const RouteEntity(
      {required this.routeId,
      required this.chargingInfoList,
      required this.remainingBatteryAtDestination});

  final int routeId;
  final List<ChargingInfoEntity> chargingInfoList;
  final double remainingBatteryAtDestination;
}
