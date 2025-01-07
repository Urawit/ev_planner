import 'package:ev_planner/features/sign_in/domain/entities/session_entity.dart';

import '../datasources/sign_in_idatatsource.dart';

class SignInDataSource implements SignInIDataSource {
  @override
  Future<SessionEntity> signIn({required String email, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

}