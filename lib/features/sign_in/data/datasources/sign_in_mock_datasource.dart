import 'package:ev_planner/features/sign_in/domain/entities/session_entity.dart';

import '../datasources/sign_in_idatatsource.dart';
import '../models/models.dart';

class SignInMockDataSource implements SignInIDataSource {
  @override
  Future<SessionEntity> signIn({required String email, required String password}) async {
    if (email == 'admin') {
      return const SessionModel(userContext: UserContextModel(
      email: 'email',
      username: "admin",
      vehicleModel: "vehicleModel"
    ));
    } else {
      throw Exception();
    }
  }
}