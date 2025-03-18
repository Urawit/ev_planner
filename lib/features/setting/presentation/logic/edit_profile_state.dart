import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../shared/exception/exception.dart';

part 'edit_profile_state.freezed.dart';

@freezed
abstract class EditProfileState with _$EditProfileState {
  const EditProfileState._();

  const factory EditProfileState.loading() = _EditProfileStateLoading;
  const factory EditProfileState.success() = _EditProfileStateSuccess;
  const factory EditProfileState.error(AnyException error) =
      _EditProfileStateError;

  AnyException? get error => whenOrNull(error: (error) => error);
}
