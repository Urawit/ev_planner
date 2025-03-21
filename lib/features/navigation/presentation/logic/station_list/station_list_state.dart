import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/exception/exception.dart';
import '../../../domain/entities/station_entity.dart';

part 'station_list_state.freezed.dart';

@freezed
abstract class StationListState with _$StationListState {
  const StationListState._();

  const factory StationListState.loading() = _StationListStateLoading;
  const factory StationListState.data({required List<StationEntity> data}) =
      _StationListStateData;
  const factory StationListState.error(AnyException error) =
      _StationListStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
