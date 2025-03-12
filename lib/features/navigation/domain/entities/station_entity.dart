import '../../data/models/review_model.dart';

abstract class StationEntity {
  const StationEntity({
    required this.stationId,
    required this.lat,
    required this.long,
    this.stationName,
    this.openTime,
    this.closedTime,
    this.address,
    this.reviewList,
  });

  final String stationId;
  final double lat;
  final double long;
  final String? stationName;
  final String? openTime;
  final String? closedTime;
  final String? address;
  final List<ReviewModel>? reviewList;
}
