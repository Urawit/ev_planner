import 'package:dio/dio.dart';

import '../../../../shared/error/error_message_model.dart';
import '../../../../shared/exception/exception.dart';
import '../../domain/entities/station_entity.dart';
import '../models/station_model.dart';
import 'station_idatasource.dart';

class StationApiDataSource implements StationIDataSource {
  final Dio dio;
  final String baseUrl = "http://10.0.2.2:8080/api/stations/list";

  StationApiDataSource({Dio? dio}) : dio = dio ?? Dio();

  @override
  Future<List<StationEntity>> getStationList() async {
    try {
      final response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        final data = response.data as List;

        List<StationEntity> stationList = data.map((item) {
          return StationModel(
            stationId: item['station_id'].toString(),
            lat: item['lat'],
            long: item['longitude'],
          );
        }).toList();

        return stationList;
      } else {
        throw const AnyException(
            ErrorMessageModel(errorMessage: "Failed to register"));
      }
    } catch (e) {
      throw AnyException(
          ErrorMessageModel(errorMessage: "Error registering: $e"));
    }
  }
}
