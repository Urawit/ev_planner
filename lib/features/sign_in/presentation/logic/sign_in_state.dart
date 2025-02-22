import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../shared/exception/exception.dart';
import '../../domain/entities/session_entity.dart';

part 'sign_in_state.freezed.dart';

@freezed
abstract class SignInState with _$SignInState {
  const SignInState._();

  const factory SignInState.initial() = _SignInStateInitial;
  const factory SignInState.loading() = _SignInStateLoading;
  const factory SignInState.success({required SessionEntity data}) =
      _SignInStateSuccess;
  const factory SignInState.error(AnyException error) = _SignInStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
