import '../../data/models/bookmark_model.dart';

abstract class UserContextEntity {
  const UserContextEntity(
      {required this.userId,
      required this.displayName,
      required this.email,
      required this.carModelId,
      required this.bookmarkList});

  final String userId;
  final String displayName;
  final String email;
  final String carModelId;
  final List<BookmarkModel> bookmarkList;
}
