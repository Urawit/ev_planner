import '../../domain/entities/entities.dart';

class GetResultModel implements GetResultEntity {
  const GetResultModel({
    required this.chargingInfoList,
    required this.totalChargingTime,
  });
  @override
  final double totalChargingTime;
  @override
  final List<ChargingInfoEntity> chargingInfoList;
}
