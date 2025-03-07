import 'package:dio/dio.dart';
import 'package:ev_planner/shared/exception/exception.dart';
import '../../../../error/error_message_model.dart';
import '../../domain/entities/vehicle_entity.dart';
import '../data.dart';

class VehicleApiDataSource implements VehicleIDataSource {
  final Dio dio;
  final String baseUrl = "http://10.0.2.2:8080/api/carbrand/list";

  VehicleApiDataSource({Dio? dio}) : dio = dio ?? Dio();

  @override
  Future<List<VehicleEntity>> getVehicleList() async {
    try {
      final response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        final data = response.data as List;

        List<VehicleEntity> vehicles = data.map((item) {
          return VehicleModel(
            carBrandName: item['brandName'],
            carModels: (item['models'] as List).map((modelItem) {
              return CarModel(
                modelId: modelItem['modelId'].toString(),
                modelName: modelItem['model_name'],
              );
            }).toList(),
          );
        }).toList();

        return vehicles;
      } else {
        throw const AnyException(
            ErrorMessageModel(errorMessage: "Failed to fetch vehicle data"));
      }
    } catch (e) {
      throw AnyException(
          ErrorMessageModel(errorMessage: "Error fetching vehicle data: $e"));
    }
  }
}
