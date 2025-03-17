import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../../shared/error/error_message_model.dart';
import '../../../../../shared/exception/exception.dart';
import '../../domain/entities/rate_input_entity.dart';
import 'rate_idatasource.dart';

class RateApiDataSource implements RateIDataSource {
  final String baseUrl = "http://10.0.2.2:8080/api/stations/rate/";

  @override
  Future<void> rate({required RateInputEntity rateInput}) async {
    try {
      final Map<String, dynamic> requestBody = {
        'user_id': rateInput.userId,
        'rating': rateInput.rating,
      };

      final response = await http.post(
        Uri.parse('$baseUrl${rateInput.stationId}'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw const AnyException(
            ErrorMessageModel(errorMessage: "Failed to rate the station"));
      }
    } catch (e) {
      throw AnyException(
          ErrorMessageModel(errorMessage: "Error rating the station: $e"));
    }
  }
}
