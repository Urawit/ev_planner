abstract class BookmarkEntity {
  const BookmarkEntity({
    required this.bookmarkId,
    required this.address,
    required this.stationName,
    required this.availablePort,
    required this.stationId,
    required this.ratecount,
    required this.averageRating,
  });
  final String bookmarkId;
  final String address;
  final String stationName;
  final int availablePort;
  final String stationId;
  final int ratecount;
  final double averageRating;
}
