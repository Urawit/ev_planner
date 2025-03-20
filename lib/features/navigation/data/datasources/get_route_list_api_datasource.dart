import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../../shared/error/error_message_model.dart';
import '../../../../../shared/exception/exception.dart';
import '../../domain/entities/entities.dart';
import '../models/models.dart';
import 'get_route_list_idatasource.dart';

class GetRouteListApiDataSource implements GetRouteListIDataSource {
  final String baseUrl = "http://10.0.2.2:8080/api/routes/cal/";

  @override
  Future<TripResultEntity> getRouteList({required int tripId}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$tripId'));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        return TripResultModel(
          tripId: responseData['tripId'],
          currentBattery: responseData['currentBattery'],
          routeList: (responseData['routeList'] as List).map((route) {
            return RouteModel(
              routeId: route['route_id'],
              chargingInfoList: (route['chargingInfoList'] as List).map((info) {
                return ChargingInfoModel(
                  batteryAtStation:
                      (info['battery_at_station'] as num).toDouble(),
                  chargeTo: (info['charge_to'] as num).toDouble(),
                  stationName: info['stationName'],
                  energyUsedWhenCharge: info['energy_used_when_charge'],
                  stationId: info['stationId'],
                );
              }).toList(),
              remainingBatteryAtDestination:
                  (route['remaining_battery_at_destination'] as num).toDouble(),
            );
          }).toList(),
        );
      } else {
        throw const AnyException(
            ErrorMessageModel(errorMessage: "Failed to get route list"));
      }
    } catch (e) {
      throw AnyException(
          ErrorMessageModel(errorMessage: "Error getting route list: $e"));
    }
  }
}
