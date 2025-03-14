import '../../data/models/review_model.dart';

abstract class StationEntity {
  const StationEntity({
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
  });

  final String stationId;
  final double? lat;
  final double? long;
  final String? stationName;
  final String? openTime;
  final String? closedTime;
  final String? address;
  final double? averageRating;
  final int? rateCount;
  final int? availablePort;
  final List<ReviewModel>? reviewList;
}
