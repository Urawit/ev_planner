part of 'delete_review_provider.dart';

class DeleteReviewNotifier extends EVNotifier<DeleteReviewState> {
  @override
  build() {
    return const DeleteReviewState.loading();
  }

  Future<void> deleteReview({required String reviewId}) async {
    state = const DeleteReviewState.loading();

    final result =
        await ref.read(deleteReviewUseCaseProvider).call(reviewId: reviewId);

    return result.fold((error) {
      state = DeleteReviewState.error(error);
    }, (result) async {
      state = const DeleteReviewState.success();
    });
  }
}
