import '../../domain/domain.dart';
import '../datasources/sign_in_idatatsource.dart';

class SignInDataSource implements SignInIDataSource {
  @override
  Future<SessionEntity> signIn({required SignInInputEntity signInInput}) {
    // TODO: connect with Backend
    throw UnimplementedError();
  }
}

// import 'package:dio/dio.dart';

// class SignInRepository {
//   final Dio _dio = Dio(BaseOptions(baseUrl: "https://yourapi.com"));

//   Future<void> signIn(String email, String password) async {
//     try {
//       final response = await _dio.post(
//         "/api/auth/signin",
//         data: {"email": email, "password": password},
//       );

//       // Handle success (e.g., store token)
//       final token = response.data['token'];
//       print("Login successful, token: $token");

//     } on DioException catch (e) {
//       if (e.response != null) {
//         final errorData = e.response!.data;
//         final errorCode = errorData['error_code'];

//         // Map error codes to exceptions
//         switch (errorCode) {
//           case "INVALID_CREDENTIALS":
//             throw InvalidCredentialsException();
//           case "USER_NOT_FOUND":
//             throw UserNotFoundException();
//           case "ACCOUNT_LOCKED":
//             throw AccountLockedException();
//           default:
//             throw UnknownSignInException(errorData['message']);
//         }
//       } else {
//         // Handle network errors
//         throw UnknownSignInException("Network error. Please try again.");
//       }
//     }
//   }
// }
