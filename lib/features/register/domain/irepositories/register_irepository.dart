import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../entities/entities.dart';

abstract class RegisterIRepository {
  Future<Either<AnyException, RegisterResultEntity>> register(
      {required RegisterInputEntity registerInput});
}
