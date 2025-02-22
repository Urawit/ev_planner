// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VehicleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<VehicleEntity> data) data,
    required TResult Function(AnyException error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<VehicleEntity> data)? data,
    TResult? Function(AnyException error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<VehicleEntity> data)? data,
    TResult Function(AnyException error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_VehicleStateLoading value) loading,
    required TResult Function(_VehicleStateData value) data,
    required TResult Function(_VehicleStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VehicleStateLoading value)? loading,
    TResult? Function(_VehicleStateData value)? data,
    TResult? Function(_VehicleStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VehicleStateLoading value)? loading,
    TResult Function(_VehicleStateData value)? data,
    TResult Function(_VehicleStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleStateCopyWith<$Res> {
  factory $VehicleStateCopyWith(
          VehicleState value, $Res Function(VehicleState) then) =
      _$VehicleStateCopyWithImpl<$Res, VehicleState>;
}

/// @nodoc
class _$VehicleStateCopyWithImpl<$Res, $Val extends VehicleState>
    implements $VehicleStateCopyWith<$Res> {
  _$VehicleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$VehicleStateLoadingImplCopyWith<$Res> {
  factory _$$VehicleStateLoadingImplCopyWith(_$VehicleStateLoadingImpl value,
          $Res Function(_$VehicleStateLoadingImpl) then) =
      __$$VehicleStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VehicleStateLoadingImplCopyWithImpl<$Res>
    extends _$VehicleStateCopyWithImpl<$Res, _$VehicleStateLoadingImpl>
    implements _$$VehicleStateLoadingImplCopyWith<$Res> {
  __$$VehicleStateLoadingImplCopyWithImpl(_$VehicleStateLoadingImpl _value,
      $Res Function(_$VehicleStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VehicleStateLoadingImpl extends _VehicleStateLoading {
  const _$VehicleStateLoadingImpl() : super._();

  @override
  String toString() {
    return 'VehicleState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<VehicleEntity> data) data,
    required TResult Function(AnyException error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<VehicleEntity> data)? data,
    TResult? Function(AnyException error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<VehicleEntity> data)? data,
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
    required TResult Function(_VehicleStateLoading value) loading,
    required TResult Function(_VehicleStateData value) data,
    required TResult Function(_VehicleStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VehicleStateLoading value)? loading,
    TResult? Function(_VehicleStateData value)? data,
    TResult? Function(_VehicleStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VehicleStateLoading value)? loading,
    TResult Function(_VehicleStateData value)? data,
    TResult Function(_VehicleStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _VehicleStateLoading extends VehicleState {
  const factory _VehicleStateLoading() = _$VehicleStateLoadingImpl;
  const _VehicleStateLoading._() : super._();
}

/// @nodoc
abstract class _$$VehicleStateDataImplCopyWith<$Res> {
  factory _$$VehicleStateDataImplCopyWith(_$VehicleStateDataImpl value,
          $Res Function(_$VehicleStateDataImpl) then) =
      __$$VehicleStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<VehicleEntity> data});
}

/// @nodoc
class __$$VehicleStateDataImplCopyWithImpl<$Res>
    extends _$VehicleStateCopyWithImpl<$Res, _$VehicleStateDataImpl>
    implements _$$VehicleStateDataImplCopyWith<$Res> {
  __$$VehicleStateDataImplCopyWithImpl(_$VehicleStateDataImpl _value,
      $Res Function(_$VehicleStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$VehicleStateDataImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<VehicleEntity>,
    ));
  }
}

/// @nodoc

class _$VehicleStateDataImpl extends _VehicleStateData {
  const _$VehicleStateDataImpl({required final List<VehicleEntity> data})
      : _data = data,
        super._();

  final List<VehicleEntity> _data;
  @override
  List<VehicleEntity> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'VehicleState.data(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleStateDataImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleStateDataImplCopyWith<_$VehicleStateDataImpl> get copyWith =>
      __$$VehicleStateDataImplCopyWithImpl<_$VehicleStateDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<VehicleEntity> data) data,
    required TResult Function(AnyException error) error,
  }) {
    return data(this.data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<VehicleEntity> data)? data,
    TResult? Function(AnyException error)? error,
  }) {
    return data?.call(this.data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<VehicleEntity> data)? data,
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
    required TResult Function(_VehicleStateLoading value) loading,
    required TResult Function(_VehicleStateData value) data,
    required TResult Function(_VehicleStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VehicleStateLoading value)? loading,
    TResult? Function(_VehicleStateData value)? data,
    TResult? Function(_VehicleStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VehicleStateLoading value)? loading,
    TResult Function(_VehicleStateData value)? data,
    TResult Function(_VehicleStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _VehicleStateData extends VehicleState {
  const factory _VehicleStateData({required final List<VehicleEntity> data}) =
      _$VehicleStateDataImpl;
  const _VehicleStateData._() : super._();

  List<VehicleEntity> get data;

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleStateDataImplCopyWith<_$VehicleStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VehicleStateErrorImplCopyWith<$Res> {
  factory _$$VehicleStateErrorImplCopyWith(_$VehicleStateErrorImpl value,
          $Res Function(_$VehicleStateErrorImpl) then) =
      __$$VehicleStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AnyException error});
}

/// @nodoc
class __$$VehicleStateErrorImplCopyWithImpl<$Res>
    extends _$VehicleStateCopyWithImpl<$Res, _$VehicleStateErrorImpl>
    implements _$$VehicleStateErrorImplCopyWith<$Res> {
  __$$VehicleStateErrorImplCopyWithImpl(_$VehicleStateErrorImpl _value,
      $Res Function(_$VehicleStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$VehicleStateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AnyException,
    ));
  }
}

/// @nodoc

class _$VehicleStateErrorImpl extends _VehicleStateError {
  const _$VehicleStateErrorImpl(this.error) : super._();

  @override
  final AnyException error;

  @override
  String toString() {
    return 'VehicleState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleStateErrorImplCopyWith<_$VehicleStateErrorImpl> get copyWith =>
      __$$VehicleStateErrorImplCopyWithImpl<_$VehicleStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<VehicleEntity> data) data,
    required TResult Function(AnyException error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<VehicleEntity> data)? data,
    TResult? Function(AnyException error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<VehicleEntity> data)? data,
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
    required TResult Function(_VehicleStateLoading value) loading,
    required TResult Function(_VehicleStateData value) data,
    required TResult Function(_VehicleStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_VehicleStateLoading value)? loading,
    TResult? Function(_VehicleStateData value)? data,
    TResult? Function(_VehicleStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_VehicleStateLoading value)? loading,
    TResult Function(_VehicleStateData value)? data,
    TResult Function(_VehicleStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _VehicleStateError extends VehicleState {
  const factory _VehicleStateError(final AnyException error) =
      _$VehicleStateErrorImpl;
  const _VehicleStateError._() : super._();

  AnyException get error;

  /// Create a copy of VehicleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleStateErrorImplCopyWith<_$VehicleStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
