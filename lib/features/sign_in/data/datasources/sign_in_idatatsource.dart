import '../../domain/domain.dart';

abstract class SignInIDataSource {
  Future<SessionEntity> signIn({required SignInInputEntity signInInput});
}
