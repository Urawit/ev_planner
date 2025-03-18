import 'package:dio/dio.dart';
import 'package:ev_planner/shared/exception/exception.dart';
import '../../../../shared/error/error_message_model.dart';
import '../../domain/entities/entities.dart';
import '../data.dart';

class EditProfileApiDataSource implements EditProfileIDataSource {
  final Dio dio;
  final String baseUrl = "http://10.0.2.2:8080/api/users/profile/";

  EditProfileApiDataSource({Dio? dio}) : dio = dio ?? Dio();

  @override
  Future<void> editProfile(
      {required EditProfileInputEntity editProfileInput}) async {
    try {
      Response response;

      if (editProfileInput.password != '') {
        response = await dio.put(
          '$baseUrl${editProfileInput.userId}',
          data: {
            'username': editProfileInput.displayName,
            'email': editProfileInput.email,
            'modelId': editProfileInput.carModelId,
            'password': editProfileInput.password,
          },
        );
      } else {
        response = await dio.put(
          '$baseUrl${editProfileInput.userId}',
          data: {
            'username': editProfileInput.displayName,
            'email': editProfileInput.email,
            'modelId': editProfileInput.carModelId,
          },
        );
      }

      if (response.statusCode == 200) {
        return;
      } else {
        throw const AnyException(
            ErrorMessageModel(errorMessage: "Failed to edit profile"));
      }
    } catch (e) {
      throw AnyException(
          ErrorMessageModel(errorMessage: "Error EditProfileing: $e"));
    }
  }
}
