import '../../domain/entities/calculate_route_input_entity.dart';

abstract class CalculateRouteIDataSource {
  Future<int> calculateRouteList(
      {required CalculateRouteInputEntity calculateRouteInput});
}
