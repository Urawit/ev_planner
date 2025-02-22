abstract class VehicleEntity {
  const VehicleEntity({
    required this.carBrand,
    required this.carModels,
  });

  final String carBrand;
  final List<String> carModels;
}