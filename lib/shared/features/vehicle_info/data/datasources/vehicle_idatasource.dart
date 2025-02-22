import '../../domain/entities/vehicle_entity.dart';

abstract class VehicleIDataSource {
  Future<List<VehicleEntity>> getVehicle();
}
