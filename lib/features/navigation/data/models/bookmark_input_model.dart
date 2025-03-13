import '../../domain/entities/bookmark_input_entity.dart';

class BookmarkInputModel implements BookmarkInputEntity {
  const BookmarkInputModel({
    required this.userId,
    required this.stationId,
  });
  @override
  final String userId;
  @override
  final String stationId;
}
