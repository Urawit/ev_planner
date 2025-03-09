// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SignInState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserContextEntity data) success,
    required TResult Function(AnyException error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserContextEntity data)? success,
    TResult? Function(AnyException error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserContextEntity data)? success,
    TResult Function(AnyException error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInStateInitial value) initial,
    required TResult Function(_SignInStateLoading value) loading,
    required TResult Function(_SignInStateSuccess value) success,
    required TResult Function(_SignInStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInStateInitial value)? initial,
    TResult? Function(_SignInStateLoading value)? loading,
    TResult? Function(_SignInStateSuccess value)? success,
    TResult? Function(_SignInStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInStateInitial value)? initial,
    TResult Function(_SignInStateLoading value)? loading,
    TResult Function(_SignInStateSuccess value)? success,
    TResult Function(_SignInStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInStateCopyWith<$Res> {
  factory $SignInStateCopyWith(
          SignInState value, $Res Function(SignInState) then) =
      _$SignInStateCopyWithImpl<$Res, SignInState>;
}

/// @nodoc
class _$SignInStateCopyWithImpl<$Res, $Val extends SignInState>
    implements $SignInStateCopyWith<$Res> {
  _$SignInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SignInStateInitialImplCopyWith<$Res> {
  factory _$$SignInStateInitialImplCopyWith(_$SignInStateInitialImpl value,
          $Res Function(_$SignInStateInitialImpl) then) =
      __$$SignInStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInStateInitialImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateInitialImpl>
    implements _$$SignInStateInitialImplCopyWith<$Res> {
  __$$SignInStateInitialImplCopyWithImpl(_$SignInStateInitialImpl _value,
      $Res Function(_$SignInStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignInStateInitialImpl extends _SignInStateInitial {
  const _$SignInStateInitialImpl() : super._();

  @override
  String toString() {
    return 'SignInState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserContextEntity data) success,
    required TResult Function(AnyException error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserContextEntity data)? success,
    TResult? Function(AnyException error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserContextEntity data)? success,
    TResult Function(AnyException error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInStateInitial value) initial,
    required TResult Function(_SignInStateLoading value) loading,
    required TResult Function(_SignInStateSuccess value) success,
    required TResult Function(_SignInStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInStateInitial value)? initial,
    TResult? Function(_SignInStateLoading value)? loading,
    TResult? Function(_SignInStateSuccess value)? success,
    TResult? Function(_SignInStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInStateInitial value)? initial,
    TResult Function(_SignInStateLoading value)? loading,
    TResult Function(_SignInStateSuccess value)? success,
    TResult Function(_SignInStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _SignInStateInitial extends SignInState {
  const factory _SignInStateInitial() = _$SignInStateInitialImpl;
  const _SignInStateInitial._() : super._();
}

/// @nodoc
abstract class _$$SignInStateLoadingImplCopyWith<$Res> {
  factory _$$SignInStateLoadingImplCopyWith(_$SignInStateLoadingImpl value,
          $Res Function(_$SignInStateLoadingImpl) then) =
      __$$SignInStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInStateLoadingImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateLoadingImpl>
    implements _$$SignInStateLoadingImplCopyWith<$Res> {
  __$$SignInStateLoadingImplCopyWithImpl(_$SignInStateLoadingImpl _value,
      $Res Function(_$SignInStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignInStateLoadingImpl extends _SignInStateLoading {
  const _$SignInStateLoadingImpl() : super._();

  @override
  String toString() {
    return 'SignInState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserContextEntity data) success,
    required TResult Function(AnyException error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserContextEntity data)? success,
    TResult? Function(AnyException error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserContextEntity data)? success,
    TResult Function(AnyException error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInStateInitial value) initial,
    required TResult Function(_SignInStateLoading value) loading,
    required TResult Function(_SignInStateSuccess value) success,
    required TResult Function(_SignInStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInStateInitial value)? initial,
    TResult? Function(_SignInStateLoading value)? loading,
    TResult? Function(_SignInStateSuccess value)? success,
    TResult? Function(_SignInStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInStateInitial value)? initial,
    TResult Function(_SignInStateLoading value)? loading,
    TResult Function(_SignInStateSuccess value)? success,
    TResult Function(_SignInStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _SignInStateLoading extends SignInState {
  const factory _SignInStateLoading() = _$SignInStateLoadingImpl;
  const _SignInStateLoading._() : super._();
}

/// @nodoc
abstract class _$$SignInStateSuccessImplCopyWith<$Res> {
  factory _$$SignInStateSuccessImplCopyWith(_$SignInStateSuccessImpl value,
          $Res Function(_$SignInStateSuccessImpl) then) =
      __$$SignInStateSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserContextEntity data});
}

/// @nodoc
class __$$SignInStateSuccessImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateSuccessImpl>
    implements _$$SignInStateSuccessImplCopyWith<$Res> {
  __$$SignInStateSuccessImplCopyWithImpl(_$SignInStateSuccessImpl _value,
      $Res Function(_$SignInStateSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$SignInStateSuccessImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserContextEntity,
    ));
  }
}

/// @nodoc

class _$SignInStateSuccessImpl extends _SignInStateSuccess {
  const _$SignInStateSuccessImpl({required this.data}) : super._();

  @override
  final UserContextEntity data;

  @override
  String toString() {
    return 'SignInState.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateSuccessImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateSuccessImplCopyWith<_$SignInStateSuccessImpl> get copyWith =>
      __$$SignInStateSuccessImplCopyWithImpl<_$SignInStateSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserContextEntity data) success,
    required TResult Function(AnyException error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserContextEntity data)? success,
    TResult? Function(AnyException error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserContextEntity data)? success,
    TResult Function(AnyException error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInStateInitial value) initial,
    required TResult Function(_SignInStateLoading value) loading,
    required TResult Function(_SignInStateSuccess value) success,
    required TResult Function(_SignInStateError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInStateInitial value)? initial,
    TResult? Function(_SignInStateLoading value)? loading,
    TResult? Function(_SignInStateSuccess value)? success,
    TResult? Function(_SignInStateError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInStateInitial value)? initial,
    TResult Function(_SignInStateLoading value)? loading,
    TResult Function(_SignInStateSuccess value)? success,
    TResult Function(_SignInStateError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _SignInStateSuccess extends SignInState {
  const factory _SignInStateSuccess({required final UserContextEntity data}) =
      _$SignInStateSuccessImpl;
  const _SignInStateSuccess._() : super._();

  UserContextEntity get data;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInStateSuccessImplCopyWith<_$SignInStateSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInStateErrorImplCopyWith<$Res> {
  factory _$$SignInStateErrorImplCopyWith(_$SignInStateErrorImpl value,
          $Res Function(_$SignInStateErrorImpl) then) =
      __$$SignInStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AnyException error});
}

/// @nodoc
class __$$SignInStateErrorImplCopyWithImpl<$Res>
    extends _$SignInStateCopyWithImpl<$Res, _$SignInStateErrorImpl>
    implements _$$SignInStateErrorImplCopyWith<$Res> {
  __$$SignInStateErrorImplCopyWithImpl(_$SignInStateErrorImpl _value,
      $Res Function(_$SignInStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$SignInStateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AnyException,
    ));
  }
}

/// @nodoc

class _$SignInStateErrorImpl extends _SignInStateError {
  const _$SignInStateErrorImpl(this.error) : super._();

  @override
  final AnyException error;

  @override
  String toString() {
    return 'SignInState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInStateErrorImplCopyWith<_$SignInStateErrorImpl> get copyWith =>
      __$$SignInStateErrorImplCopyWithImpl<_$SignInStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(UserContextEntity data) success,
    required TResult Function(AnyException error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(UserContextEntity data)? success,
    TResult? Function(AnyException error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(UserContextEntity data)? success,
    TResult Function(AnyException error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInStateInitial value) initial,
    required TResult Function(_SignInStateLoading value) loading,
    required TResult Function(_SignInStateSuccess value) success,
    required TResult Function(_SignInStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInStateInitial value)? initial,
    TResult? Function(_SignInStateLoading value)? loading,
    TResult? Function(_SignInStateSuccess value)? success,
    TResult? Function(_SignInStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInStateInitial value)? initial,
    TResult Function(_SignInStateLoading value)? loading,
    TResult Function(_SignInStateSuccess value)? success,
    TResult Function(_SignInStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _SignInStateError extends SignInState {
  const factory _SignInStateError(final AnyException error) =
      _$SignInStateErrorImpl;
  const _SignInStateError._() : super._();

  AnyException get error;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInStateErrorImplCopyWith<_$SignInStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
