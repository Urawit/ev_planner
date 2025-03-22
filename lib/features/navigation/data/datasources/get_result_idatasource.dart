import '../../domain/entities/get_result_entity.dart';

abstract class GetResultIDataSource {
  Future<GetResultEntity> getResult({required int resultId});
}
