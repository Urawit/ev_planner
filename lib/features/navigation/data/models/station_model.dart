import '../../domain/entities/station_entity.dart';
import 'review_model.dart';

class StationModel implements StationEntity {
  const StationModel({
    required this.stationId,
    this.lat,
    this.long,
    this.stationName,
    this.openTime,
    this.closedTime,
    this.address,
    this.avergeRating,
    this.rateCount,
    this.availablePort,
    this.reviewList,
  });
  @override
  final String stationId;

  @override
  final double? lat;

  @override
  final double? long;

  @override
  final String? stationName;

  @override
  final String? openTime;

  @override
  final String? closedTime;

  @override
  final String? address;

  @override
  final double? avergeRating;

  @override
  final int? rateCount;

  @override
  final int? availablePort;

  @override
  final List<ReviewModel>? reviewList;
}
