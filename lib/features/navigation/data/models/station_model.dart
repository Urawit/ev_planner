import '../../domain/entities/station_entity.dart';
import 'models.dart';

class StationModel implements StationEntity {
  const StationModel({
    required this.stationId,
    this.lat,
    this.long,
    this.stationName,
    this.openTime,
    this.closedTime,
    this.address,
    this.averageRating,
    this.rateCount,
    this.availablePort,
    this.reviewList,
    this.ratingList,
    this.plugList,
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
  final double? averageRating;

  @override
  final int? rateCount;

  @override
  final int? availablePort;

  @override
  final List<ReviewModel>? reviewList;

  @override
  final List<RatingModel>? ratingList;

  @override
  final List<PlugModel>? plugList;
}
