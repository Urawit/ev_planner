part of 'edit_review_provider.dart';

class EditReviewNotifier extends EVNotifier<EditReviewState> {
  @override
  build() {
    return const EditReviewState.loading();
  }

  Future<void> editReview(
      {required String reviewId, required String comment}) async {
    state = const EditReviewState.loading();

    final result = await ref
        .read(editReviewUseCaseProvider)
        .call(reviewId: reviewId, comment: comment);

    return result.fold((error) {
      state = EditReviewState.error(error);
    }, (result) async {
      state = const EditReviewState.success();
    });
  }
}
