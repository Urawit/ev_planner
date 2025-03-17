import '../../domain/entities/rate_input_entity.dart';

class RateInputModel implements RateInputEntity {
  const RateInputModel(
      {required this.stationId, required this.userId, required this.rating});
  @override
  final String stationId;
  @override
  final String userId;
  @override
  final double rating;
}
