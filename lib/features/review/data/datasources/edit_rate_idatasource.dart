import '../../domain/entities/rate_input_entity.dart';

abstract class EditRateIDataSource {
  Future<void> editRate({required RateInputEntity rateInput});
}
