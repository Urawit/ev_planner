import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/exception/exception.dart';
import '../domain/entities/vehicle_entity.dart';

part 'vehicle_state.freezed.dart';

@freezed
abstract class VehicleState with _$VehicleState {
  const VehicleState._();

  const factory VehicleState.loading() = _VehicleStateLoading;
  const factory VehicleState.data({required List<VehicleEntity> data}) =
      _VehicleStateData;
  const factory VehicleState.error(AnyException error) = _VehicleStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
