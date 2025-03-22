abstract class ChargingInfoEntity {
  const ChargingInfoEntity(
      {this.batteryAtStation,
      this.chargeTo,
      required this.stationName,
      required this.energyUsedWhenCharge,
      required this.stationId,
      this.plugId,
      this.chargingTime,
      this.lat,
      this.long});

  final double? batteryAtStation;
  final double? chargeTo;
  final String stationName;
  final int energyUsedWhenCharge;
  final int stationId;
  final int? plugId;
  final double? chargingTime;
  final double? lat;
  final double? long;
}
