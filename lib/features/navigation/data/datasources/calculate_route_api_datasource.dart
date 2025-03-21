import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../../shared/error/error_message_model.dart';
import '../../../../../shared/exception/exception.dart';
import '../../domain/entities/entities.dart';
import 'calculate_route_idatasource.dart';

class CalculateRouteApiDataSource implements CalculateRouteIDataSource {
  final String baseUrl = "http://10.0.2.2:8080/api/trips/save";

  @override
  Future<int> calculateRouteList(
      {required CalculateRouteInputEntity calculateRouteInput}) async {
    try {
      final Map<String, dynamic> requestBody = {
        "model_id": int.tryParse(calculateRouteInput.modelId),
        "total_distance": calculateRouteInput.totalDistance,
        "current_battery": calculateRouteInput.currentBattery,
        "distancesList": calculateRouteInput.distanceList
            .map((station) => {
                  "station_id": station.stationId,
                  "distance": station.distanceFromStartToStation,
                })
            .toList(),
      };

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        int tripId = responseData['trip_id'];

        return tripId;
      } else {
        throw const AnyException(
            ErrorMessageModel(errorMessage: "Failed to calculate route list"));
      }
    } catch (e) {
      throw AnyException(
          ErrorMessageModel(errorMessage: "Error calculating route list: $e"));
    }
  }
}
