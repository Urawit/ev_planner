import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/exception/exception.dart';
import '../../../domain/entities/trip_result_entity.dart';

part 'get_route_list_state.freezed.dart';

@freezed
abstract class GetRouteListState with _$GetRouteListState {
  const GetRouteListState._();

  const factory GetRouteListState.loading() = _GetRouteListStateLoading;
  const factory GetRouteListState.data({required TripResultEntity data}) =
      _GetRouteListStateData;
  const factory GetRouteListState.error(AnyException error) =
      _GetRouteListStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
