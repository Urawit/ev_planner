import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/exception/exception.dart';

part 'delete_bookmark_state.freezed.dart';

@freezed
abstract class DeleteBookmarkState with _$DeleteBookmarkState {
  const DeleteBookmarkState._();

  const factory DeleteBookmarkState.loading() = _SaveBookmarkStateLoading;
  const factory DeleteBookmarkState.data({required bool success}) =
      _SaveBookmarkStateData;
  const factory DeleteBookmarkState.error(AnyException error) =
      _SaveBookmarkStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
