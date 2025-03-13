import '../../domain/entities/bookmark_entity.dart';

abstract class GetBookmarkListIDataSource {
  Future<List<BookmarkEntity>> getBookmarkList({required String userId});
}
