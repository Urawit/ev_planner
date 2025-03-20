import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/exception/exception.dart';

part 'calculate_route_state.freezed.dart';

@freezed
abstract class CalculateRouteState with _$CalculateRouteState {
  const CalculateRouteState._();

  const factory CalculateRouteState.loading() = _CalculateRouteStateLoading;
  const factory CalculateRouteState.success({required int tripId}) =
      _CalculateRouteStateSuccess;
  const factory CalculateRouteState.error(AnyException error) =
      _CalculateRouteStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
