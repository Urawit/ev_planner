import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../entities/entities.dart';

abstract class EditProfileIRepository {
  Future<Either<AnyException, void>> editProfile(
      {required EditProfileInputEntity editProfileInput});
}
