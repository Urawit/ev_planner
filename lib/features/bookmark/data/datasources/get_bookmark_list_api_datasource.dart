import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../../shared/error/error_message_model.dart';
import '../../../../../shared/exception/exception.dart';

import '../../domain/entities/bookmark_entity.dart';
import '../model/bookmark_model.dart';
import 'get_bookmark_list_idatasource.dart';

class GetBookmarkListApiDataSource implements GetBookmarkListIDataSource {
  final String baseUrl = "http://10.0.2.2:8080/api/bookmark/user/";

  @override
  Future<List<BookmarkEntity>> getBookmarkList({required String userId}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$userId'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body);

        return jsonList
            .map((json) => BookmarkModel(
                  bookmarkId: json['bookmarkId'].toString(),
                  address: json['address'],
                  stationName: json['station_name'],
                  availablePort: json['port_available'],
                  stationId: json['station_id'].toString(),
                  ratecount: json['rating_count'],
                  averageRating: (json['average_rating'] as num).toDouble(),
                ))
            .toList();
      } else {
        throw const AnyException(
            ErrorMessageModel(errorMessage: "Failed to get bookmark list"));
      }
    } catch (e) {
      throw AnyException(
          ErrorMessageModel(errorMessage: "Error getting bookmark list: $e"));
    }
  }
}
