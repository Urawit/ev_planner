import 'package:dartz/dartz.dart';

import '../../../../shared/exception/exception.dart';
import '../domain.dart';

class EditProfileUseCase {
  const EditProfileUseCase({
    required EditProfileIRepository repository,
  }) : _repository = repository;

  final EditProfileIRepository _repository;

  Future<Either<AnyException, void>> call(
      {required EditProfileInputEntity editProfileInput}) {
    return _repository.editProfile(editProfileInput: editProfileInput);
  }
}
