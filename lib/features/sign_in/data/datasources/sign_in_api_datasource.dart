import '../../domain/domain.dart';
import '../datasources/sign_in_idatatsource.dart';

class SignInApiDataSource implements SignInIDataSource {
  @override
  Future<SessionEntity> signIn({required SignInInputEntity signInInput}) {
    // TODO: connect with Backend
    throw UnimplementedError();
  }
}
