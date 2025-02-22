import 'package:dio/dio.dart';
import 'package:ev_planner/shared/exception/exception.dart';
import '../../../../shared/error/error_message_model.dart';
import '../../domain/entities/entities.dart';
import '../data.dart';

class RegisterApiDataSource implements RegisterIDataSource {
  final Dio dio;
  final String baseUrl =
      "http://your-api-url.com/api/register"; 

  RegisterApiDataSource({Dio? dio}) : dio = dio ?? Dio();

  @override
  Future<RegisterResultEntity> register(
      {required RegisterInputEntity registerInput}) async {
    try {
      final response = await dio.post(
        baseUrl,
        data: {
          'displayName': registerInput.displayName,
          'email': registerInput.email,
          'password': registerInput.password,
          'confirmPassword': registerInput.confirmPassword,
          'carBrand': registerInput.carBrand,
          'carModel': registerInput.carModel,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        return RegisterResultModel(success: data['success'] as bool);
      } else {
        throw const AnyException(
            ErrorMessageModel(errorMessage: "Failed to register"));
      }
    } catch (e) {
      throw AnyException(
          ErrorMessageModel(errorMessage: "Error registering: $e"));
    }
  }
}
