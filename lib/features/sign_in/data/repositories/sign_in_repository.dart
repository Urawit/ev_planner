import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/domain.dart';
import '../datasources/sign_in_idatatsource.dart';

class SignInRepository implements SignInIRepository{
  const SignInRepository({required this.remoteDataSource});
  final SignInIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, SessionEntity>> signIn({required SignInInputEntity signInInput}) async {
    try {
      final result = await remoteDataSource.signIn(signInInput: signInInput);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
