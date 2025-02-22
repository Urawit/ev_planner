import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/exception/exception.dart';
import '../../domain/entities/register_result_entity.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const RegisterState._();

  const factory RegisterState.initial() = _RegisterStateInitial;
  const factory RegisterState.loading() = _RegisterStateLoading;
  const factory RegisterState.success({required RegisterResultEntity data}) =
      _RegisterStateSuccess;
  const factory RegisterState.error(AnyException error) = _RegisterStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
