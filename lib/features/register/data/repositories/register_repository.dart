import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/domain.dart';
import '../data.dart';

class RegisterRepository implements RegisterIRepository {
  const RegisterRepository({required this.remoteDataSource});
  final RegisterIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, RegisterResultEntity>> register(
      {required RegisterInputEntity registerInput}) async {
    try {
      final result =
          await remoteDataSource.register(registerInput: registerInput);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
