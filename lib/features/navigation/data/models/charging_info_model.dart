import '../../domain/entities/charging_info_entity.dart';

class ChargingInfoModel implements ChargingInfoEntity {
  const ChargingInfoModel(
      {required this.batteryAtStation,
      required this.chargeTo,
      required this.stationName,
      required this.energyUsedWhenCharge,
      required this.stationId,
      this.plugId});

  @override
  final double batteryAtStation;
  @override
  final double chargeTo;
  @override
  final String stationName;
  @override
  final int energyUsedWhenCharge;
  @override
  final int stationId;
  @override
  final int? plugId;
}
