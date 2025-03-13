import 'package:http/http.dart' as http;
import '../../../../../shared/error/error_message_model.dart';
import '../../../../../shared/exception/exception.dart';
import 'delete_bookmark_idatasource.dart';

class DeleteBookmarkApiDataSource implements DeleteBookmarkIDataSource {
  final String baseUrl = "http://10.0.2.2:8080/api/bookmark";

  @override
  Future<bool> deleteBookmark({required String bookmarkId}) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl$bookmarkId'));

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
