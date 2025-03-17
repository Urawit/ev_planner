import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/exception/exception.dart';

part 'rate_state.freezed.dart';

@freezed
abstract class RateState with _$RateState {
  const RateState._();

  const factory RateState.loading() = _RateStateLoading;
  const factory RateState.success() = _RateStateSuccess;
  const factory RateState.error(AnyException error) = _RateStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
