import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../../shared/error/error_message_model.dart';
import '../../../../../shared/exception/exception.dart';
import '../../domain/entities/post_review_input_entity.dart';
import 'post_review_idatasource.dart';

class PostReviewApiDataSource implements PostReviewIDataSource {
  final String baseUrl = "http://10.0.2.2:8080/api/reviews/save";

  @override
  Future<void> postReview(
      {required PostReviewInputEntity postReviewInput}) async {
    try {
      final Map<String, dynamic> requestBody = {
        'comment': postReviewInput.comment,
        'stationId': postReviewInput.stationId,
        'userId': postReviewInput.userId
      };

      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw const AnyException(
            ErrorMessageModel(errorMessage: "Failed to post review"));
      }
    } catch (e) {
      throw AnyException(
          ErrorMessageModel(errorMessage: "Error posting review: $e"));
    }
  }
}
