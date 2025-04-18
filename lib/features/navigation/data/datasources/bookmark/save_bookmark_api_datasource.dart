import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../../shared/error/error_message_model.dart';
import '../../../../../shared/exception/exception.dart';
import '../../../domain/domain.dart';
import 'save_bookmark_idatasource.dart';

class SaveBookmarkApiDataSource implements SaveBookmarkIDataSource {
  final String baseUrl = "http://10.0.2.2:8080/api/bookmark/save";

  @override
  Future<bool> saveBookmark(
      {required BookmarkInputEntity bookmarkInput}) async {
    try {
      final requestBody = jsonEncode({
        'user_id': int.tryParse(bookmarkInput.userId.toString()),
        'station_id': int.tryParse(bookmarkInput.stationId.toString()),
      });

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        throw const AnyException(
            ErrorMessageModel(errorMessage: "Failed to get save this station"));
      }
    } catch (e) {
      throw AnyException(
          ErrorMessageModel(errorMessage: "Error saving this station: $e"));
    }
  }
}
