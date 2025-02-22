import '../../domain/entities/vehicle_entity.dart';
import '../models/vehicle_model.dart';
import 'vehicle_idatasource.dart';

class VehicleMockDatasource implements VehicleIDataSource {
  final Map<String, List<String>> carData = {
    "Toyota": ["Camry", "Corolla", "RAV4"],
    "Honda": ["Civic", "Accord", "CR-V"],
    "Ford": ["Focus", "Mustang", "F-150"],
    "BMW": ["X5", "M3", "320i"],
  };

  @override
  Future<List<VehicleEntity>> getVehicle() async {
    return carData.entries
        .map((entry) =>
            VehicleModel(carBrand: entry.key, carModels: entry.value))
        .toList();
  }
}


