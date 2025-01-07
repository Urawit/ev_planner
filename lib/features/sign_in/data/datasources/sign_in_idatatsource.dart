import '../../domain/entities/session_entity.dart';

abstract class SignInIDataSource {
  Future<SessionEntity> signIn({required String email, required String password});
}