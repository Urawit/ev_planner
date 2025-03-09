import '../../domain/entities/station_entity.dart';

class StationModel implements StationEntity {
  const StationModel({
    required this.stationId,
    required this.lat,
    required this.long,
    this.stationName,
    this.openTime,
    this.closedTime,
    this.address,
    this.reviewList,
  });
  @override
  final String stationId;

  @override
  final double lat;

  @override
  final double long;

  @override
  final String? stationName;

  @override
  final String? openTime;

  @override
  final String? closedTime;

  @override
  final String? address;

  @override
  final String? reviewList;
}
