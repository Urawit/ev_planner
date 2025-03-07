import 'package:dio/dio.dart';
import 'package:ev_planner/shared/exception/exception.dart';
import '../../../../shared/error/error_message_model.dart';
import '../../domain/entities/entities.dart';
import '../data.dart';

class RegisterApiDataSource implements RegisterIDataSource {
  final Dio dio;
  final String baseUrl = "http://10.0.2.2:8080/api/users/signup";

  RegisterApiDataSource({Dio? dio}) : dio = dio ?? Dio();

  @override
  Future<RegisterResultEntity> register(
      {required RegisterInputEntity registerInput}) async {
    try {
      final response = await dio.post(
        baseUrl,
        data: {
          'username': registerInput.displayName,
          'email': registerInput.email,
          'password': registerInput.password,
          'model_id': registerInput.carModelId,
        },
      );

      if (response.statusCode == 200) {
        return const RegisterResultModel(success: true);
      } else {
        throw const AnyException(
            ErrorMessageModel(errorMessage: "Failed to register"));
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 409) {
        throw EmailExistsException(
            errorMessage: "The email has already been taken.");
      } else {
        throw AnyException(
            ErrorMessageModel(errorMessage: "Error registering: ${e.message}"));
      }
    } catch (e) {
      throw AnyException(
          ErrorMessageModel(errorMessage: "Error registering: $e"));
    }
  }
}
