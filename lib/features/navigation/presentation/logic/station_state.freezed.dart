// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<StationEntity> data) data,
    required TResult Function(AnyException error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<StationEntity> data)? data,
    TResult? Function(AnyException error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<StationEntity> data)? data,
    TResult Function(AnyException error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StationStateLoading value) loading,
    required TResult Function(_StationStateData value) data,
    required TResult Function(_StationStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StationStateLoading value)? loading,
    TResult? Function(_StationStateData value)? data,
    TResult? Function(_StationStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StationStateLoading value)? loading,
    TResult Function(_StationStateData value)? data,
    TResult Function(_StationStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationStateCopyWith<$Res> {
  factory $StationStateCopyWith(
          StationState value, $Res Function(StationState) then) =
      _$StationStateCopyWithImpl<$Res, StationState>;
}

/// @nodoc
class _$StationStateCopyWithImpl<$Res, $Val extends StationState>
    implements $StationStateCopyWith<$Res> {
  _$StationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StationStateLoadingImplCopyWith<$Res> {
  factory _$$StationStateLoadingImplCopyWith(_$StationStateLoadingImpl value,
          $Res Function(_$StationStateLoadingImpl) then) =
      __$$StationStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StationStateLoadingImplCopyWithImpl<$Res>
    extends _$StationStateCopyWithImpl<$Res, _$StationStateLoadingImpl>
    implements _$$StationStateLoadingImplCopyWith<$Res> {
  __$$StationStateLoadingImplCopyWithImpl(_$StationStateLoadingImpl _value,
      $Res Function(_$StationStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StationStateLoadingImpl extends _StationStateLoading {
  const _$StationStateLoadingImpl() : super._();

  @override
  String toString() {
    return 'StationState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<StationEntity> data) data,
    required TResult Function(AnyException error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<StationEntity> data)? data,
    TResult? Function(AnyException error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<StationEntity> data)? data,
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
    required TResult Function(_StationStateLoading value) loading,
    required TResult Function(_StationStateData value) data,
    required TResult Function(_StationStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StationStateLoading value)? loading,
    TResult? Function(_StationStateData value)? data,
    TResult? Function(_StationStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StationStateLoading value)? loading,
    TResult Function(_StationStateData value)? data,
    TResult Function(_StationStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _StationStateLoading extends StationState {
  const factory _StationStateLoading() = _$StationStateLoadingImpl;
  const _StationStateLoading._() : super._();
}

/// @nodoc
abstract class _$$StationStateDataImplCopyWith<$Res> {
  factory _$$StationStateDataImplCopyWith(_$StationStateDataImpl value,
          $Res Function(_$StationStateDataImpl) then) =
      __$$StationStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<StationEntity> data});
}

/// @nodoc
class __$$StationStateDataImplCopyWithImpl<$Res>
    extends _$StationStateCopyWithImpl<$Res, _$StationStateDataImpl>
    implements _$$StationStateDataImplCopyWith<$Res> {
  __$$StationStateDataImplCopyWithImpl(_$StationStateDataImpl _value,
      $Res Function(_$StationStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$StationStateDataImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StationEntity>,
    ));
  }
}

/// @nodoc

class _$StationStateDataImpl extends _StationStateData {
  const _$StationStateDataImpl({required final List<StationEntity> data})
      : _data = data,
        super._();

  final List<StationEntity> _data;
  @override
  List<StationEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'StationState.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationStateDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of StationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationStateDataImplCopyWith<_$StationStateDataImpl> get copyWith =>
      __$$StationStateDataImplCopyWithImpl<_$StationStateDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<StationEntity> data) data,
    required TResult Function(AnyException error) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<StationEntity> data)? data,
    TResult? Function(AnyException error)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<StationEntity> data)? data,
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
    required TResult Function(_StationStateLoading value) loading,
    required TResult Function(_StationStateData value) data,
    required TResult Function(_StationStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StationStateLoading value)? loading,
    TResult? Function(_StationStateData value)? data,
    TResult? Function(_StationStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StationStateLoading value)? loading,
    TResult Function(_StationStateData value)? data,
    TResult Function(_StationStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _StationStateData extends StationState {
  const factory _StationStateData({required final List<StationEntity> data}) =
      _$StationStateDataImpl;
  const _StationStateData._() : super._();

  List<StationEntity> get data;

  /// Create a copy of StationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationStateDataImplCopyWith<_$StationStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StationStateErrorImplCopyWith<$Res> {
  factory _$$StationStateErrorImplCopyWith(_$StationStateErrorImpl value,
          $Res Function(_$StationStateErrorImpl) then) =
      __$$StationStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AnyException error});
}

/// @nodoc
class __$$StationStateErrorImplCopyWithImpl<$Res>
    extends _$StationStateCopyWithImpl<$Res, _$StationStateErrorImpl>
    implements _$$StationStateErrorImplCopyWith<$Res> {
  __$$StationStateErrorImplCopyWithImpl(_$StationStateErrorImpl _value,
      $Res Function(_$StationStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$StationStateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AnyException,
    ));
  }
}

/// @nodoc

class _$StationStateErrorImpl extends _StationStateError {
  const _$StationStateErrorImpl(this.error) : super._();

  @override
  final AnyException error;

  @override
  String toString() {
    return 'StationState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of StationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationStateErrorImplCopyWith<_$StationStateErrorImpl> get copyWith =>
      __$$StationStateErrorImplCopyWithImpl<_$StationStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<StationEntity> data) data,
    required TResult Function(AnyException error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<StationEntity> data)? data,
    TResult? Function(AnyException error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<StationEntity> data)? data,
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
    required TResult Function(_StationStateLoading value) loading,
    required TResult Function(_StationStateData value) data,
    required TResult Function(_StationStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StationStateLoading value)? loading,
    TResult? Function(_StationStateData value)? data,
    TResult? Function(_StationStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StationStateLoading value)? loading,
    TResult Function(_StationStateData value)? data,
    TResult Function(_StationStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _StationStateError extends StationState {
  const factory _StationStateError(final AnyException error) =
      _$StationStateErrorImpl;
  const _StationStateError._() : super._();

  AnyException get error;

  /// Create a copy of StationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationStateErrorImplCopyWith<_$StationStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
