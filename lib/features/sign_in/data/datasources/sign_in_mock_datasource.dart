import 'package:ev_planner/features/sign_in/domain/entities/session_entity.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/entities/sign_in_entity.dart';
import '../datasources/sign_in_idatatsource.dart';
import '../models/models.dart';

class SignInMockDataSource implements SignInIDataSource {
  @override
  Future<SessionEntity> signIn({required SignInInputEntity signInInput}) async {
    if (signInInput.email == 'admin') {
      return const SessionModel(
          userContext: UserContextModel(
              email: 'email', username: 'admin', vehicleModel: 'vehicleModel'));
    } else {
      throw InvalidPasswordException(
          errorCode: '400', errorMessage: 'InvalidInputException');
    }
  }
}
