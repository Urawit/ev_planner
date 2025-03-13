import 'package:dio/dio.dart';
import 'package:ev_planner/shared/error/error_message_model.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/domain.dart';
import '../datasources/sign_in_idatatsource.dart';
import '../models/models.dart';

class SignInApiDataSource implements SignInIDataSource {
  final Dio dio;
  final String baseUrl = "http://10.0.2.2:8080/api/auth/login";

  SignInApiDataSource({Dio? dio}) : dio = dio ?? Dio();

  @override
  Future<UserContextEntity> signIn(
      {required SignInInputEntity signInInput}) async {
    try {
      final response = await dio.post(
        baseUrl,
        data: {
          'email': signInInput.email,
          'password': signInInput.password,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;

        final userData = data['user'];

        final List<dynamic> bookmarksData = userData['bookmarkList'] ?? [];

        final List<BookmarkModel> bookmarks = bookmarksData.map((bookmark) {
          return BookmarkModel(
            bookmarkId: bookmark['bookmarkId'].toString(),
            stationId: bookmark['station_id'].toString(),
          );
        }).toList();

        return UserContextModel(
            userId: userData['userId'].toString(),
            displayName: userData['username'],
            email: userData['email'],
            carModelId: userData['model_id'].toString(),
            bookmarkList: bookmarks);
      } else {
        throw const AnyException(
            ErrorMessageModel(errorMessage: "Failed to login"));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw InvalidPasswordException(
            errorMessage: "Either email or password is incorrect.");
      } else if (e.response?.statusCode == 404) {
        throw UserNotFoundException(
            errorMessage: "No account found with this email.");
      } else {
        throw AnyException(
            ErrorMessageModel(errorMessage: "Error on login: ${e.message}"));
      }
    } catch (e) {
      throw AnyException(ErrorMessageModel(errorMessage: "Error on login: $e"));
    }
  }
}
