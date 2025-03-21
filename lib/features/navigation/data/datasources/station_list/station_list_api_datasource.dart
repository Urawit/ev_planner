import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../../shared/error/error_message_model.dart';
import '../../../../../shared/exception/exception.dart';
import '../../../domain/entities/station_entity.dart';
import '../../models/models.dart';
import 'station_list_idatasource.dart';

class StationListApiDataSource implements StationListIDataSource {
  final String baseUrl = "http://10.0.2.2:8080/api/stations/list";

  @override
  Future<List<StationEntity>> getStationList() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);

        return data.map((stationItem) {
          return StationModel(
            stationId: stationItem['stationId'].toString(),
            stationName: stationItem['station_name'],
            openTime: stationItem['openhours'],
            lat: stationItem['lat'],
            long: stationItem['longitude'],
            address: stationItem['address'],
            averageRating: stationItem['average_rating'],
            rateCount: stationItem['rating_count'],
            availablePort: stationItem['port_available'],
            reviewList: (stationItem['reviewsList'] as List).map((reviewItem) {
              return ReviewModel(
                  reviewId: reviewItem['review_id'].toString(),
                  comment: reviewItem['comment'],
                  createDate: reviewItem['create_date'],
                  userId: reviewItem['user_id'].toString(),
                  stationId: reviewItem['station_id'].toString(),
                  username: reviewItem['username']);
            }).toList(),
            ratingList:
                (stationItem['stationRatings'] as List).map((ratingItem) {
              return RatingModel(
                ratingId: ratingItem['rating_id'].toString(),
                rating: ratingItem['rating'].toString(),
                userId: ratingItem['user_id'].toString(),
              );
            }).toList(),
            plugList: (stationItem['plugList'] as List).map((plugItem) {
              return PlugModel(
                plugId: plugItem['plug_id'].toString(),
                status: plugItem['status'],
                plugType: plugItem['plug_type'],
                price: plugItem['pricing'],
                maxKwh: plugItem['maxKwh'].toString(),
              );
            }).toList(),
          );
        }).toList();
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
