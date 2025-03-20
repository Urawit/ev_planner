// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_route_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetRouteListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(TripResultEntity data) data,
    required TResult Function(AnyException error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(TripResultEntity data)? data,
    TResult? Function(AnyException error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(TripResultEntity data)? data,
    TResult Function(AnyException error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetRouteListStateLoading value) loading,
    required TResult Function(_GetRouteListStateData value) data,
    required TResult Function(_GetRouteListStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRouteListStateLoading value)? loading,
    TResult? Function(_GetRouteListStateData value)? data,
    TResult? Function(_GetRouteListStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRouteListStateLoading value)? loading,
    TResult Function(_GetRouteListStateData value)? data,
    TResult Function(_GetRouteListStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRouteListStateCopyWith<$Res> {
  factory $GetRouteListStateCopyWith(
          GetRouteListState value, $Res Function(GetRouteListState) then) =
      _$GetRouteListStateCopyWithImpl<$Res, GetRouteListState>;
}

/// @nodoc
class _$GetRouteListStateCopyWithImpl<$Res, $Val extends GetRouteListState>
    implements $GetRouteListStateCopyWith<$Res> {
  _$GetRouteListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetRouteListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetRouteListStateLoadingImplCopyWith<$Res> {
  factory _$$GetRouteListStateLoadingImplCopyWith(
          _$GetRouteListStateLoadingImpl value,
          $Res Function(_$GetRouteListStateLoadingImpl) then) =
      __$$GetRouteListStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetRouteListStateLoadingImplCopyWithImpl<$Res>
    extends _$GetRouteListStateCopyWithImpl<$Res,
        _$GetRouteListStateLoadingImpl>
    implements _$$GetRouteListStateLoadingImplCopyWith<$Res> {
  __$$GetRouteListStateLoadingImplCopyWithImpl(
      _$GetRouteListStateLoadingImpl _value,
      $Res Function(_$GetRouteListStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetRouteListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetRouteListStateLoadingImpl extends _GetRouteListStateLoading {
  const _$GetRouteListStateLoadingImpl() : super._();

  @override
  String toString() {
    return 'GetRouteListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRouteListStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(TripResultEntity data) data,
    required TResult Function(AnyException error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(TripResultEntity data)? data,
    TResult? Function(AnyException error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(TripResultEntity data)? data,
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
    required TResult Function(_GetRouteListStateLoading value) loading,
    required TResult Function(_GetRouteListStateData value) data,
    required TResult Function(_GetRouteListStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRouteListStateLoading value)? loading,
    TResult? Function(_GetRouteListStateData value)? data,
    TResult? Function(_GetRouteListStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRouteListStateLoading value)? loading,
    TResult Function(_GetRouteListStateData value)? data,
    TResult Function(_GetRouteListStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _GetRouteListStateLoading extends GetRouteListState {
  const factory _GetRouteListStateLoading() = _$GetRouteListStateLoadingImpl;
  const _GetRouteListStateLoading._() : super._();
}

/// @nodoc
abstract class _$$GetRouteListStateDataImplCopyWith<$Res> {
  factory _$$GetRouteListStateDataImplCopyWith(
          _$GetRouteListStateDataImpl value,
          $Res Function(_$GetRouteListStateDataImpl) then) =
      __$$GetRouteListStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TripResultEntity data});
}

/// @nodoc
class __$$GetRouteListStateDataImplCopyWithImpl<$Res>
    extends _$GetRouteListStateCopyWithImpl<$Res, _$GetRouteListStateDataImpl>
    implements _$$GetRouteListStateDataImplCopyWith<$Res> {
  __$$GetRouteListStateDataImplCopyWithImpl(_$GetRouteListStateDataImpl _value,
      $Res Function(_$GetRouteListStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetRouteListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$GetRouteListStateDataImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as TripResultEntity,
    ));
  }
}

/// @nodoc

class _$GetRouteListStateDataImpl extends _GetRouteListStateData {
  const _$GetRouteListStateDataImpl({required this.data}) : super._();

  @override
  final TripResultEntity data;

  @override
  String toString() {
    return 'GetRouteListState.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRouteListStateDataImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of GetRouteListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRouteListStateDataImplCopyWith<_$GetRouteListStateDataImpl>
      get copyWith => __$$GetRouteListStateDataImplCopyWithImpl<
          _$GetRouteListStateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(TripResultEntity data) data,
    required TResult Function(AnyException error) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(TripResultEntity data)? data,
    TResult? Function(AnyException error)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(TripResultEntity data)? data,
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
    required TResult Function(_GetRouteListStateLoading value) loading,
    required TResult Function(_GetRouteListStateData value) data,
    required TResult Function(_GetRouteListStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRouteListStateLoading value)? loading,
    TResult? Function(_GetRouteListStateData value)? data,
    TResult? Function(_GetRouteListStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRouteListStateLoading value)? loading,
    TResult Function(_GetRouteListStateData value)? data,
    TResult Function(_GetRouteListStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _GetRouteListStateData extends GetRouteListState {
  const factory _GetRouteListStateData({required final TripResultEntity data}) =
      _$GetRouteListStateDataImpl;
  const _GetRouteListStateData._() : super._();

  TripResultEntity get data;

  /// Create a copy of GetRouteListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetRouteListStateDataImplCopyWith<_$GetRouteListStateDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetRouteListStateErrorImplCopyWith<$Res> {
  factory _$$GetRouteListStateErrorImplCopyWith(
          _$GetRouteListStateErrorImpl value,
          $Res Function(_$GetRouteListStateErrorImpl) then) =
      __$$GetRouteListStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AnyException error});
}

/// @nodoc
class __$$GetRouteListStateErrorImplCopyWithImpl<$Res>
    extends _$GetRouteListStateCopyWithImpl<$Res, _$GetRouteListStateErrorImpl>
    implements _$$GetRouteListStateErrorImplCopyWith<$Res> {
  __$$GetRouteListStateErrorImplCopyWithImpl(
      _$GetRouteListStateErrorImpl _value,
      $Res Function(_$GetRouteListStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetRouteListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetRouteListStateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AnyException,
    ));
  }
}

/// @nodoc

class _$GetRouteListStateErrorImpl extends _GetRouteListStateError {
  const _$GetRouteListStateErrorImpl(this.error) : super._();

  @override
  final AnyException error;

  @override
  String toString() {
    return 'GetRouteListState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRouteListStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of GetRouteListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRouteListStateErrorImplCopyWith<_$GetRouteListStateErrorImpl>
      get copyWith => __$$GetRouteListStateErrorImplCopyWithImpl<
          _$GetRouteListStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(TripResultEntity data) data,
    required TResult Function(AnyException error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(TripResultEntity data)? data,
    TResult? Function(AnyException error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(TripResultEntity data)? data,
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
    required TResult Function(_GetRouteListStateLoading value) loading,
    required TResult Function(_GetRouteListStateData value) data,
    required TResult Function(_GetRouteListStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRouteListStateLoading value)? loading,
    TResult? Function(_GetRouteListStateData value)? data,
    TResult? Function(_GetRouteListStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRouteListStateLoading value)? loading,
    TResult Function(_GetRouteListStateData value)? data,
    TResult Function(_GetRouteListStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _GetRouteListStateError extends GetRouteListState {
  const factory _GetRouteListStateError(final AnyException error) =
      _$GetRouteListStateErrorImpl;
  const _GetRouteListStateError._() : super._();

  AnyException get error;

  /// Create a copy of GetRouteListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetRouteListStateErrorImplCopyWith<_$GetRouteListStateErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
