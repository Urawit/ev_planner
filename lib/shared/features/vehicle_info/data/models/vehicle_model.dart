import '../../domain/entities/vehicle_entity.dart';

class VehicleModel implements VehicleEntity {
  const VehicleModel({required this.carBrandName, required this.carModels});

  @override
  final String carBrandName;

  @override
  final List<CarModel> carModels;
}

class CarModel implements CarEntity {
  const CarModel({
    required this.modelId,
    required this.modelName,
  });

  @override
  final String modelId;
  @override
  final String modelName;
}
