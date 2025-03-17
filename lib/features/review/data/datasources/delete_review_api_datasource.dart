import 'package:http/http.dart' as http;
import '../../../../../shared/error/error_message_model.dart';
import '../../../../../shared/exception/exception.dart';
import 'delete_review_idatasource.dart';

class DeleteReviewApiDataSource implements DeleteReviewIDataSource {
  final String baseUrl = "http://10.0.2.2:8080/api/reviews/";

  @override
  Future<void> deleteReview({required String reviewId}) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl$reviewId'),
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw const AnyException(
            ErrorMessageModel(errorMessage: "Failed to edit review"));
      }
    } catch (e) {
      throw AnyException(
          ErrorMessageModel(errorMessage: "Error editing review: $e"));
    }
  }
}
