import '../../domain/entities/rate_input_entity.dart';

abstract class RateIDataSource {
  Future<void> rate({required RateInputEntity rateInput});
}
