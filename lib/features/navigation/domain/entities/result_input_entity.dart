import 'charging_info_entity.dart';

abstract class ResultInputEntity {
  const ResultInputEntity(
      {required this.modelId, required this.chargingInfoList});
  final int modelId;
  final List<ChargingInfoEntity> chargingInfoList;
}
