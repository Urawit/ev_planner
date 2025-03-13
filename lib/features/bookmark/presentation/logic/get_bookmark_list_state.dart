import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/exception/exception.dart';
import '../../domain/entities/bookmark_entity.dart';

part 'get_bookmark_list_state.freezed.dart';

@freezed
abstract class GetBookmarkListState with _$GetBookmarkListState {
  const GetBookmarkListState._();

  const factory GetBookmarkListState.loading() = _GetBookmarkListStateLoading;
  const factory GetBookmarkListState.data(
      {required List<BookmarkEntity> data}) = _GetBookmarkListStateData;
  const factory GetBookmarkListState.error(AnyException error) =
      _GetBookmarkListStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
