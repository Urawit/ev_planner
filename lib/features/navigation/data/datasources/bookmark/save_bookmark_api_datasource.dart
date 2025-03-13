import 'package:http/http.dart' as http;
import '../../../../../shared/error/error_message_model.dart';
import '../../../../../shared/exception/exception.dart';
import '../../../domain/domain.dart';
import 'save_bookmark_idatasource.dart';

class SaveBookmarkApiDataSource implements SaveBookmarkIDataSource {
  final String baseUrl = "http://10.0.2.2:8080/api/bookmark/save/";

  @override
  Future<bool> saveBookmark(
      {required BookmarkInputEntity bookmarkInput}) async {
    try {
      final response = await http.post(Uri.parse(baseUrl));

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
