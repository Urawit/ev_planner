import 'package:dartz/dartz.dart';

import '../entities/session_entity.dart';

abstract class SignInIRepository {
  Future<Either<Exception, SessionEntity>> signIn({
    required String email,
    required String password
  });
}