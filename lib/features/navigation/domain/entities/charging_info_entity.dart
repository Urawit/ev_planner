abstract class ChargingInfoEntity {
  const ChargingInfoEntity(
      {required this.batteryAtStation,
      required this.chargeTo,
      required this.stationName,
      required this.energyUsedWhenCharge,
      required this.stationId,
      this.plugId});

  final double batteryAtStation;
  final double chargeTo;
  final String stationName;
  final int energyUsedWhenCharge;
  final int stationId;
  final int? plugId;
}
