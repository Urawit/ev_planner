import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/exception/exception.dart';
import '../../../domain/entities/station_entity.dart';

part 'station_detail_state.freezed.dart';

@freezed
abstract class StationDetailState with _$StationDetailState {
  const StationDetailState._();

  const factory StationDetailState.loading() = _StationDetailStateLoading;
  const factory StationDetailState.data({required StationEntity data}) =
      _StationDetailStateData;
  const factory StationDetailState.error(AnyException error) =
      _StationDetailStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
