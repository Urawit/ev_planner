// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetResultState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(GetResultEntity data) data,
    required TResult Function(AnyException error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(GetResultEntity data)? data,
    TResult? Function(AnyException error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(GetResultEntity data)? data,
    TResult Function(AnyException error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResultStateLoading value) loading,
    required TResult Function(_GetResultStateData value) data,
    required TResult Function(_GetResultStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResultStateLoading value)? loading,
    TResult? Function(_GetResultStateData value)? data,
    TResult? Function(_GetResultStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResultStateLoading value)? loading,
    TResult Function(_GetResultStateData value)? data,
    TResult Function(_GetResultStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetResultStateCopyWith<$Res> {
  factory $GetResultStateCopyWith(
          GetResultState value, $Res Function(GetResultState) then) =
      _$GetResultStateCopyWithImpl<$Res, GetResultState>;
}

/// @nodoc
class _$GetResultStateCopyWithImpl<$Res, $Val extends GetResultState>
    implements $GetResultStateCopyWith<$Res> {
  _$GetResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetResultStateLoadingImplCopyWith<$Res> {
  factory _$$GetResultStateLoadingImplCopyWith(
          _$GetResultStateLoadingImpl value,
          $Res Function(_$GetResultStateLoadingImpl) then) =
      __$$GetResultStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetResultStateLoadingImplCopyWithImpl<$Res>
    extends _$GetResultStateCopyWithImpl<$Res, _$GetResultStateLoadingImpl>
    implements _$$GetResultStateLoadingImplCopyWith<$Res> {
  __$$GetResultStateLoadingImplCopyWithImpl(_$GetResultStateLoadingImpl _value,
      $Res Function(_$GetResultStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetResultStateLoadingImpl extends _GetResultStateLoading {
  const _$GetResultStateLoadingImpl() : super._();

  @override
  String toString() {
    return 'GetResultState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetResultStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(GetResultEntity data) data,
    required TResult Function(AnyException error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(GetResultEntity data)? data,
    TResult? Function(AnyException error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(GetResultEntity data)? data,
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
    required TResult Function(_GetResultStateLoading value) loading,
    required TResult Function(_GetResultStateData value) data,
    required TResult Function(_GetResultStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResultStateLoading value)? loading,
    TResult? Function(_GetResultStateData value)? data,
    TResult? Function(_GetResultStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResultStateLoading value)? loading,
    TResult Function(_GetResultStateData value)? data,
    TResult Function(_GetResultStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _GetResultStateLoading extends GetResultState {
  const factory _GetResultStateLoading() = _$GetResultStateLoadingImpl;
  const _GetResultStateLoading._() : super._();
}

/// @nodoc
abstract class _$$GetResultStateDataImplCopyWith<$Res> {
  factory _$$GetResultStateDataImplCopyWith(_$GetResultStateDataImpl value,
          $Res Function(_$GetResultStateDataImpl) then) =
      __$$GetResultStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetResultEntity data});
}

/// @nodoc
class __$$GetResultStateDataImplCopyWithImpl<$Res>
    extends _$GetResultStateCopyWithImpl<$Res, _$GetResultStateDataImpl>
    implements _$$GetResultStateDataImplCopyWith<$Res> {
  __$$GetResultStateDataImplCopyWithImpl(_$GetResultStateDataImpl _value,
      $Res Function(_$GetResultStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$GetResultStateDataImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as GetResultEntity,
    ));
  }
}

/// @nodoc

class _$GetResultStateDataImpl extends _GetResultStateData {
  const _$GetResultStateDataImpl({required this.data}) : super._();

  @override
  final GetResultEntity data;

  @override
  String toString() {
    return 'GetResultState.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetResultStateDataImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of GetResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetResultStateDataImplCopyWith<_$GetResultStateDataImpl> get copyWith =>
      __$$GetResultStateDataImplCopyWithImpl<_$GetResultStateDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(GetResultEntity data) data,
    required TResult Function(AnyException error) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(GetResultEntity data)? data,
    TResult? Function(AnyException error)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(GetResultEntity data)? data,
    TResult Function(AnyException error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this.data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetResultStateLoading value) loading,
    required TResult Function(_GetResultStateData value) data,
    required TResult Function(_GetResultStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResultStateLoading value)? loading,
    TResult? Function(_GetResultStateData value)? data,
    TResult? Function(_GetResultStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResultStateLoading value)? loading,
    TResult Function(_GetResultStateData value)? data,
    TResult Function(_GetResultStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _GetResultStateData extends GetResultState {
  const factory _GetResultStateData({required final GetResultEntity data}) =
      _$GetResultStateDataImpl;
  const _GetResultStateData._() : super._();

  GetResultEntity get data;

  /// Create a copy of GetResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetResultStateDataImplCopyWith<_$GetResultStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetResultStateErrorImplCopyWith<$Res> {
  factory _$$GetResultStateErrorImplCopyWith(_$GetResultStateErrorImpl value,
          $Res Function(_$GetResultStateErrorImpl) then) =
      __$$GetResultStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AnyException error});
}

/// @nodoc
class __$$GetResultStateErrorImplCopyWithImpl<$Res>
    extends _$GetResultStateCopyWithImpl<$Res, _$GetResultStateErrorImpl>
    implements _$$GetResultStateErrorImplCopyWith<$Res> {
  __$$GetResultStateErrorImplCopyWithImpl(_$GetResultStateErrorImpl _value,
      $Res Function(_$GetResultStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetResultStateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AnyException,
    ));
  }
}

/// @nodoc

class _$GetResultStateErrorImpl extends _GetResultStateError {
  const _$GetResultStateErrorImpl(this.error) : super._();

  @override
  final AnyException error;

  @override
  String toString() {
    return 'GetResultState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetResultStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of GetResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetResultStateErrorImplCopyWith<_$GetResultStateErrorImpl> get copyWith =>
      __$$GetResultStateErrorImplCopyWithImpl<_$GetResultStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(GetResultEntity data) data,
    required TResult Function(AnyException error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(GetResultEntity data)? data,
    TResult? Function(AnyException error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(GetResultEntity data)? data,
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
    required TResult Function(_GetResultStateLoading value) loading,
    required TResult Function(_GetResultStateData value) data,
    required TResult Function(_GetResultStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetResultStateLoading value)? loading,
    TResult? Function(_GetResultStateData value)? data,
    TResult? Function(_GetResultStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetResultStateLoading value)? loading,
    TResult Function(_GetResultStateData value)? data,
    TResult Function(_GetResultStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _GetResultStateError extends GetResultState {
  const factory _GetResultStateError(final AnyException error) =
      _$GetResultStateErrorImpl;
  const _GetResultStateError._() : super._();

  AnyException get error;

  /// Create a copy of GetResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetResultStateErrorImplCopyWith<_$GetResultStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
