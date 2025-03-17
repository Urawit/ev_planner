import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/exception/exception.dart';

part 'edit_rate_state.freezed.dart';

@freezed
abstract class EditRateState with _$EditRateState {
  const EditRateState._();

  const factory EditRateState.loading() = _EditRateStateLoading;
  const factory EditRateState.success() = _EditRateStateSuccess;
  const factory EditRateState.error(AnyException error) = _EditRateStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
