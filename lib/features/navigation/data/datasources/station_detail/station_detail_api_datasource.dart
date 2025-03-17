import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../shared/error/error_message_model.dart';
import '../../../../../shared/exception/exception.dart';
import '../../../domain/entities/station_entity.dart';
import '../../models/models.dart';
import 'station_detail_idatasource.dart';

class StationDetailApiDataSource implements StationDetailIDataSource {
  final String baseUrl = "http://10.0.2.2:8080/api/stations/";

  @override
  Future<StationEntity> getStationDetail({required String stationId}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$stationId'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        return StationModel(
          stationId: data['stationId'].toString(),
          stationName: data['station_name'],
          openTime: data['opentime'],
          closedTime: data['closetime'],
          lat: data['lat'],
          long: data['longitude'],
          address: data['address'],
          averageRating: data['average_rating'],
          rateCount: data['rating_count'],
          availablePort: data['port_available'],
          reviewList: (data['reviewsList'] as List).map((reviewItem) {
            return ReviewModel(
                reviewId: reviewItem['review_id'].toString(),
                comment: reviewItem['comment'],
                createDate: reviewItem['create_date'],
                userId: reviewItem['user_id'].toString(),
                stationId: reviewItem['station_id'].toString(),
                username: reviewItem['username']);
          }).toList(),
          plugList: (data['plugList'] as List).map((plugItem) {
            return PlugModel(
              plugId: plugItem['plug_id'].toString(),
              status: plugItem['status'],
              plugType: plugItem['plug_type'],
              price: plugItem['pricing'],
              maxKwh: plugItem['maxKwh'].toString(),
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
