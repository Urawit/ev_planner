import '../../domain/entities/vehicle_entity.dart';

// TODO for getting data to show in register page
class VehicleModel implements VehicleEntity {
  const VehicleModel({required this.carBrand, required this.carModels});

  @override
  final String carBrand;

  @override
  final List<String> carModels;
}
