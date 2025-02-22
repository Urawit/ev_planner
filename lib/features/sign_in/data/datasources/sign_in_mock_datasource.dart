import 'package:ev_planner/features/sign_in/domain/domain.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../datasources/sign_in_idatatsource.dart';
import '../models/models.dart';

class SignInMockDataSource implements SignInIDataSource {
  @override
  Future<SessionEntity> signIn({required SignInInputEntity signInInput}) async {
    if (signInInput.email == 'admin') {
      return const SessionModel(
          userContext: UserContextModel(
              email: 'email',
              displayName: 'admin',
              carBrand: 'carBrand',
              carModel: 'carModel'));
    } else {
      throw InvalidPasswordException(
          errorCode: '400', errorMessage: 'InvalidInputException');
    }
  }
}
