import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../shared/error/error_message_model.dart';
import '../../../../../shared/exception/exception.dart';
import '../../domain/entities/get_result_entity.dart';
import '../models/models.dart';
import 'get_result_idatasource.dart';

class GetResultApiDataSource implements GetResultIDataSource {
  final String baseUrl = "http://10.0.2.2:8080/api/result/";

  @override
  Future<GetResultEntity> getResult({required int resultId}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$resultId'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return GetResultModel(
          totalChargingTime: data['totalChargingTime'],
          chargingInfoList:
              (data['chargingInfoList'] as List).map((chargingInfoItem) {
            return ChargingInfoModel(
              batteryAtStation: null,
              chargeTo: null,
              stationName: chargingInfoItem['stationName'],
              energyUsedWhenCharge: chargingInfoItem['energyUsedWhenCharge'],
              stationId: chargingInfoItem['stationId'],
              chargingTime: chargingInfoItem['chargingTime'],
              lat: chargingInfoItem['lat'],
              long: chargingInfoItem['lng'],
            );
          }).toList(),
        );
      } else {
        throw const AnyException(
            ErrorMessageModel(errorMessage: "Failed to get station details"));
      }
    } catch (e) {
      throw AnyException(ErrorMessageModel(
          errorMessage: "Error fetching station details: $e"));
    }
  }
}
