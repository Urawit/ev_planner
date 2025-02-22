import '../../domain/entities/vehicle_entity.dart';

class VehicleModel implements VehicleEntity {
  const VehicleModel({required this.carBrand, required this.carModels});

  @override
  final String carBrand;

  @override
  final List<String> carModels;
}
