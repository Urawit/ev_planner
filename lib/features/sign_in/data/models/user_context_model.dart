import '../../domain/entities/entities.dart';
import 'bookmark_model.dart';

class UserContextModel implements UserContextEntity {
  const UserContextModel(
      {required this.userId,
      required this.displayName,
      required this.email,
      required this.carModelId,
      required this.bookmarkList});

  @override
  final String userId;

  @override
  final String email;

  @override
  final String displayName;

  @override
  final String carModelId;

  @override
  final List<BookmarkModel> bookmarkList;
}
