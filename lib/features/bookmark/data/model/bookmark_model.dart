import '../../domain/entities/bookmark_entity.dart';

class BookmarkModel implements BookmarkEntity {
  const BookmarkModel({
    required this.bookmarkId,
    required this.address,
    required this.stationName,
    required this.availablePort,
    required this.stationId,
    required this.ratecount,
    required this.averageRating,
  });
  @override
  final String bookmarkId;
  @override
  final String address;
  @override
  final String stationName;
  @override
  final int availablePort;
  @override
  final String stationId;
  @override
  final int ratecount;
  @override
  final double averageRating;
}
