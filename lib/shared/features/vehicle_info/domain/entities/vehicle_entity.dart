import '../../data/models/vehicle_model.dart';

abstract class VehicleEntity {
  const VehicleEntity({
    required this.carBrandName,
    required this.carModels,
  });

  final String carBrandName;
  final List<CarModel> carModels;
}

abstract class CarEntity {
  const CarEntity({
    required this.modelId,
    required this.modelName,
  });

  final String modelId;
  final String modelName;
}
