import 'package:dartz/dartz.dart';
import 'package:ev_planner/shared/exception/exception.dart';

import '../../domain/domain.dart';
import '../data.dart';

class EditProfileRepository implements EditProfileIRepository {
  const EditProfileRepository({required this.remoteDataSource});
  final EditProfileIDataSource remoteDataSource;

  @override
  Future<Either<AnyException, void>> editProfile(
      {required EditProfileInputEntity editProfileInput}) async {
    try {
      final result = await remoteDataSource.editProfile(
          editProfileInput: editProfileInput);
      return Right(result);
    } on AnyException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerException(errorMessage: e.toString()));
    }
  }
}
