import '../../domain/entities/charging_info_entity.dart';

class ChargingInfoModel implements ChargingInfoEntity {
  const ChargingInfoModel(
      {this.batteryAtStation,
      this.chargeTo,
      required this.stationName,
      required this.energyUsedWhenCharge,
      required this.stationId,
      this.plugId,
      this.chargingTime,
      this.lat,
      this.long});

  @override
  final double? batteryAtStation;
  @override
  final double? chargeTo;
  @override
  final String stationName;
  @override
  final int energyUsedWhenCharge;
  @override
  final int stationId;
  @override
  final int? plugId;
  @override
  final double? chargingTime;
  @override
  final double? lat;
  @override
  final double? long;
}
