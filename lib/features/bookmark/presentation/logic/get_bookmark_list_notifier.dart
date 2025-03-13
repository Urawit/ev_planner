part of 'get_bookmark_list_provider.dart';

class GetBookmarkListNotifier extends EVNotifier<GetBookmarkListState> {
  @override
  build() {
    return const GetBookmarkListState.loading();
  }

  Future<void> getBookmarkList({required String userId}) async {
    state = const GetBookmarkListState.loading();

    final result =
        await ref.read(getBookmarkListUseCaseProvider).call(userId: userId);

    return result.fold((error) {
      state = GetBookmarkListState.error(error);
    }, (result) async {
      state = GetBookmarkListState.data(data: result);
    });
  }
}
