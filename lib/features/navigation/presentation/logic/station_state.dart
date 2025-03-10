import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/exception/exception.dart';
import '../../domain/entities/station_entity.dart';

part 'station_state.freezed.dart';

@freezed
abstract class StationState with _$StationState {
  const StationState._();

  const factory StationState.loading() = _StationStateLoading;
  const factory StationState.data({required List<StationEntity> data}) =
      _StationStateData;
  const factory StationState.error(AnyException error) = _StationStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
