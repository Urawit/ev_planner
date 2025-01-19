import 'package:dartz/dartz.dart';

import '../../../../shared/exception/exception.dart';
import '../domain.dart';

class SignInUseCase {
  const SignInUseCase({
    required SignInIRepository repository,
  }) : _repository = repository;

  final SignInIRepository _repository;

  Future<Either<AnyException, SessionEntity>> call({
    required SignInInputEntity signInInput
  }) {
    return _repository.signIn(signInInput: signInInput);
  }
}