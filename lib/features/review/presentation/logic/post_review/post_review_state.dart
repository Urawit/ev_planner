import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/exception/exception.dart';

part 'post_review_state.freezed.dart';

@freezed
abstract class PostReviewState with _$PostReviewState {
  const PostReviewState._();

  const factory PostReviewState.loading() = _PostReviewStateLoading;
  const factory PostReviewState.success() = _PostReviewStateSuccess;
  const factory PostReviewState.error(AnyException error) =
      _PostReviewStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
