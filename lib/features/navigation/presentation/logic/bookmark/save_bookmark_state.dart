import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/exception/exception.dart';

part 'save_bookmark_state.freezed.dart';

@freezed
abstract class SaveBookmarkState with _$SaveBookmarkState {
  const SaveBookmarkState._();

  const factory SaveBookmarkState.loading() = _SaveBookmarkStateLoading;
  const factory SaveBookmarkState.data({required bool success}) =
      _SaveBookmarkStateData;
  const factory SaveBookmarkState.error(AnyException error) =
      _SaveBookmarkStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
