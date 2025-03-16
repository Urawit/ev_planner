import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../../shared/error/error_message_model.dart';
import '../../../../../shared/exception/exception.dart';
import 'edit_review_idatasource.dart';

class EditReviewApiDataSource implements EditReviewIDataSource {
  final String baseUrl = "http://10.0.2.2:8080/api/reviews/";

  @override
  Future<void> editReview(
      {required String reviewId, required String comment}) async {
    try {
      final Map<String, dynamic> requestBody = {
        'comment': comment,
      };

      final response = await http.put(
        Uri.parse('$baseUrl$reviewId'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
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
