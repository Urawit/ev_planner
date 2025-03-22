import 'charging_info_entity.dart';

abstract class GetResultEntity {
  const GetResultEntity({
    required this.chargingInfoList,
    required this.totalChargingTime,
  });
  final double totalChargingTime;
  final List<ChargingInfoEntity> chargingInfoList;
}
