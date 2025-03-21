import '../../domain/entities/entities.dart';

class ResultInputModel implements ResultInputEntity {
  const ResultInputModel(
      {required this.modelId, required this.chargingInfoList});

  @override
  final int modelId;
  @override
  final List<ChargingInfoEntity> chargingInfoList;
}
