import '../../../domain/entities/bookmark_input_entity.dart';

abstract class SaveBookmarkIDataSource {
  Future<bool> saveBookmark({required BookmarkInputEntity bookmarkInput});
}
