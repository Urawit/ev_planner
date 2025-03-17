part of 'post_review_provider.dart';

class PostReviewNotifier extends EVNotifier<PostReviewState> {
  @override
  build() {
    return const PostReviewState.loading();
  }

  Future<void> postReview(
      {required PostReviewInputEntity postReviewInput}) async {
    state = const PostReviewState.loading();

    final result = await ref
        .read(postReviewUseCaseProvider)
        .call(postReviewInput: postReviewInput);

    return result.fold((error) {
      state = PostReviewState.error(error);
    }, (result) async {
      state = const PostReviewState.success();
    });
  }
}
