import 'package:dartz/dartz.dart';

import '../../../../shared/exception/exception.dart';
import '../entities/entities.dart';
import '../irepositories/register_irepository.dart';

class RegisterUsecase {
  const RegisterUsecase({
    required RegisterIRepository repository,
  }) : _repository = repository;

  final RegisterIRepository _repository;

  Future<Either<AnyException, RegisterResultEntity>> call(
      {required RegisterInputEntity registerInput}) {
    return _repository.register(registerInput: registerInput);
  }
}
