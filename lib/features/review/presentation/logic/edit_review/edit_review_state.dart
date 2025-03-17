import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/exception/exception.dart';

part 'edit_review_state.freezed.dart';

@freezed
abstract class EditReviewState with _$EditReviewState {
  const EditReviewState._();

  const factory EditReviewState.loading() = _EditReviewStateLoading;
  const factory EditReviewState.success() = _EditReviewStateSuccess;
  const factory EditReviewState.error(AnyException error) =
      _EditReviewStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
