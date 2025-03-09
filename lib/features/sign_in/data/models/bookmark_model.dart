import '../../domain/entities/bookmark_entity.dart';

class BookmarkModel implements BookmarkEntity {
  const BookmarkModel({required this.bookmarkId, required this.stationId});

  @override
  final String bookmarkId;
  @override
  final String stationId;
}
