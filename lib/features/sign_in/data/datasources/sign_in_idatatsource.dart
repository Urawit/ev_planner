import '../../domain/domain.dart';

abstract class SignInIDataSource {
  Future<UserContextEntity> signIn({required SignInInputEntity signInInput});
}
