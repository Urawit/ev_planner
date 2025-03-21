// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StationListState {
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
    required TResult Function(_StationListStateLoading value) loading,
    required TResult Function(_StationListStateData value) data,
    required TResult Function(_StationListStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StationListStateLoading value)? loading,
    TResult? Function(_StationListStateData value)? data,
    TResult? Function(_StationListStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StationListStateLoading value)? loading,
    TResult Function(_StationListStateData value)? data,
    TResult Function(_StationListStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationListStateCopyWith<$Res> {
  factory $StationListStateCopyWith(
          StationListState value, $Res Function(StationListState) then) =
      _$StationListStateCopyWithImpl<$Res, StationListState>;
}

/// @nodoc
class _$StationListStateCopyWithImpl<$Res, $Val extends StationListState>
    implements $StationListStateCopyWith<$Res> {
  _$StationListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StationListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StationListStateLoadingImplCopyWith<$Res> {
  factory _$$StationListStateLoadingImplCopyWith(
          _$StationListStateLoadingImpl value,
          $Res Function(_$StationListStateLoadingImpl) then) =
      __$$StationListStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StationListStateLoadingImplCopyWithImpl<$Res>
    extends _$StationListStateCopyWithImpl<$Res, _$StationListStateLoadingImpl>
    implements _$$StationListStateLoadingImplCopyWith<$Res> {
  __$$StationListStateLoadingImplCopyWithImpl(
      _$StationListStateLoadingImpl _value,
      $Res Function(_$StationListStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StationListStateLoadingImpl extends _StationListStateLoading {
  const _$StationListStateLoadingImpl() : super._();

  @override
  String toString() {
    return 'StationListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationListStateLoadingImpl);
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
    required TResult Function(_StationListStateLoading value) loading,
    required TResult Function(_StationListStateData value) data,
    required TResult Function(_StationListStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StationListStateLoading value)? loading,
    TResult? Function(_StationListStateData value)? data,
    TResult? Function(_StationListStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StationListStateLoading value)? loading,
    TResult Function(_StationListStateData value)? data,
    TResult Function(_StationListStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _StationListStateLoading extends StationListState {
  const factory _StationListStateLoading() = _$StationListStateLoadingImpl;
  const _StationListStateLoading._() : super._();
}

/// @nodoc
abstract class _$$StationListStateDataImplCopyWith<$Res> {
  factory _$$StationListStateDataImplCopyWith(_$StationListStateDataImpl value,
          $Res Function(_$StationListStateDataImpl) then) =
      __$$StationListStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<StationEntity> data});
}

/// @nodoc
class __$$StationListStateDataImplCopyWithImpl<$Res>
    extends _$StationListStateCopyWithImpl<$Res, _$StationListStateDataImpl>
    implements _$$StationListStateDataImplCopyWith<$Res> {
  __$$StationListStateDataImplCopyWithImpl(_$StationListStateDataImpl _value,
      $Res Function(_$StationListStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$StationListStateDataImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<StationEntity>,
    ));
  }
}

/// @nodoc

class _$StationListStateDataImpl extends _StationListStateData {
  const _$StationListStateDataImpl({required final List<StationEntity> data})
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
    return 'StationListState.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationListStateDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of StationListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationListStateDataImplCopyWith<_$StationListStateDataImpl>
      get copyWith =>
          __$$StationListStateDataImplCopyWithImpl<_$StationListStateDataImpl>(
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
    required TResult Function(_StationListStateLoading value) loading,
    required TResult Function(_StationListStateData value) data,
    required TResult Function(_StationListStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StationListStateLoading value)? loading,
    TResult? Function(_StationListStateData value)? data,
    TResult? Function(_StationListStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StationListStateLoading value)? loading,
    TResult Function(_StationListStateData value)? data,
    TResult Function(_StationListStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _StationListStateData extends StationListState {
  const factory _StationListStateData(
      {required final List<StationEntity> data}) = _$StationListStateDataImpl;
  const _StationListStateData._() : super._();

  List<StationEntity> get data;

  /// Create a copy of StationListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationListStateDataImplCopyWith<_$StationListStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StationListStateErrorImplCopyWith<$Res> {
  factory _$$StationListStateErrorImplCopyWith(
          _$StationListStateErrorImpl value,
          $Res Function(_$StationListStateErrorImpl) then) =
      __$$StationListStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AnyException error});
}

/// @nodoc
class __$$StationListStateErrorImplCopyWithImpl<$Res>
    extends _$StationListStateCopyWithImpl<$Res, _$StationListStateErrorImpl>
    implements _$$StationListStateErrorImplCopyWith<$Res> {
  __$$StationListStateErrorImplCopyWithImpl(_$StationListStateErrorImpl _value,
      $Res Function(_$StationListStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of StationListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$StationListStateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AnyException,
    ));
  }
}

/// @nodoc

class _$StationListStateErrorImpl extends _StationListStateError {
  const _$StationListStateErrorImpl(this.error) : super._();

  @override
  final AnyException error;

  @override
  String toString() {
    return 'StationListState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StationListStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of StationListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StationListStateErrorImplCopyWith<_$StationListStateErrorImpl>
      get copyWith => __$$StationListStateErrorImplCopyWithImpl<
          _$StationListStateErrorImpl>(this, _$identity);

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
    required TResult Function(_StationListStateLoading value) loading,
    required TResult Function(_StationListStateData value) data,
    required TResult Function(_StationListStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StationListStateLoading value)? loading,
    TResult? Function(_StationListStateData value)? data,
    TResult? Function(_StationListStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StationListStateLoading value)? loading,
    TResult Function(_StationListStateData value)? data,
    TResult Function(_StationListStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _StationListStateError extends StationListState {
  const factory _StationListStateError(final AnyException error) =
      _$StationListStateErrorImpl;
  const _StationListStateError._() : super._();

  AnyException get error;

  /// Create a copy of StationListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StationListStateErrorImplCopyWith<_$StationListStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
