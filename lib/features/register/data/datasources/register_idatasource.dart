import '../../domain/domain.dart';

abstract class RegisterIDataSource {
  Future<RegisterResultEntity> register({required RegisterInputEntity registerInput});
}
