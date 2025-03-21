import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/exception/exception.dart';

part 'result_state.freezed.dart';

@freezed
abstract class ResultState with _$ResultState {
  const ResultState._();

  const factory ResultState.loading() = _ResultStateLoading;
  const factory ResultState.data({required int resultId}) = _ResultStateData;
  const factory ResultState.error(AnyException error) = _ResultStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
