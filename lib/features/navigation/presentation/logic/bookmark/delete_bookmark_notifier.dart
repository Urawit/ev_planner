part of 'delete_bookmark_provider.dart';

class DeleteBookmarkNotifier extends EVNotifier<DeleteBookmarkState> {
  @override
  build() {
    return const DeleteBookmarkState.loading();
  }

  Future<void> deleteBookmark({required String bookmarkId}) async {
    state = const DeleteBookmarkState.loading();

    final result = await ref
        .read(deleteBookmarkUseCaseProvider)
        .call(bookmarkId: bookmarkId);

    return result.fold((error) {
      state = DeleteBookmarkState.error(error);
    }, (result) async {
      state = const DeleteBookmarkState.data(success: true);
    });
  }
}
