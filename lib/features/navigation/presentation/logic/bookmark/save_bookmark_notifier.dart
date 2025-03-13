part of 'save_bookmark_provider.dart';

class SaveBookmarkNotifier extends EVNotifier<SaveBookmarkState> {
  @override
  build() {
    return const SaveBookmarkState.loading();
  }

  Future<void> saveBookmark(
      {required BookmarkInputEntity bookmarkInput}) async {
    state = const SaveBookmarkState.loading();

    final result = await ref
        .read(saveBookmarkUseCaseProvider)
        .call(bookmarkInput: bookmarkInput);

    return result.fold((error) {
      state = SaveBookmarkState.error(error);
    }, (result) async {
      state = const SaveBookmarkState.data(success: true);
    });
  }
}
