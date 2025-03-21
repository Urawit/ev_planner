import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../../shared/error/error_message_model.dart';
import '../../../../../shared/exception/exception.dart';
import '../../domain/entities/entities.dart';
import 'result_idatasource.dart';

class ResultApiDataSource implements ResultIDataSource {
  final String baseUrl = "http://10.0.2.2:8080/api/trips/save";

  @override
  Future<int> calculateResult({required ResultInputEntity resultInput}) async {
    try {
      final Map<String, dynamic> requestBody = {
        "modelId": resultInput.modelId,
        "totalChargingTime": null,
        "chargingInfoList": resultInput.chargingInfoList
            .map((chargingInfo) => {
                  "stationId": chargingInfo.stationId,
                  "plugId": chargingInfo.plugId,
                  "energyUsedWhenCharge": chargingInfo.energyUsedWhenCharge,
                  "chargingTime": null,
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

        int resultId = responseData['resultId'];

        return resultId;
      } else {
        throw const AnyException(
            ErrorMessageModel(errorMessage: "Failed to get calculate result"));
      }
    } catch (e) {
      throw AnyException(
          ErrorMessageModel(errorMessage: "Error calculating result: $e"));
    }
  }
}
