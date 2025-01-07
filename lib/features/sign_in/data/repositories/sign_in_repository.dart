import 'package:dartz/dartz.dart';

import '../../domain/domain.dart';
import '../datasources/sign_in_idatatsource.dart';

class SignInRepository implements SignInIRepository{
  const SignInRepository({required this.remoteDataSource});
  final SignInIDataSource remoteDataSource;

  @override
  Future<Either<Exception, SessionEntity>> signIn({required String email, required String password}) async {
    try {
      final result = await remoteDataSource.signIn(email: email, password: password);
      return Right(result);
    } on Exception catch (e) {
      return Left(e);
    } catch (e) {
      return Left(Exception(e.toString()));
    }
  }
  
}