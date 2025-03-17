import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/exception/exception.dart';

part 'delete_review_state.freezed.dart';

@freezed
abstract class DeleteReviewState with _$DeleteReviewState {
  const DeleteReviewState._();

  const factory DeleteReviewState.loading() = _DeleteReviewStateLoading;
  const factory DeleteReviewState.success() = _DeleteReviewStateSuccess;
  const factory DeleteReviewState.error(AnyException error) =
      _DeleteReviewStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
