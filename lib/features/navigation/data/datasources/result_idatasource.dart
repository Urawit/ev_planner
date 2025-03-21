import '../../domain/entities/result_input_entity.dart';

abstract class ResultIDataSource {
  Future<int> calculateResult({required ResultInputEntity resultInput});
}
