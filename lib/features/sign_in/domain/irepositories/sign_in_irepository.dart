import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../entities/entities.dart';

abstract class SignInIRepository {
  Future<Either<AnyException, SessionEntity>> signIn({
    required SignInInputEntity signInInput
  });
}