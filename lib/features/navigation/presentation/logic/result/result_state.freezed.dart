// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResultState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int resultId) data,
    required TResult Function(AnyException error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int resultId)? data,
    TResult? Function(AnyException error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int resultId)? data,
    TResult Function(AnyException error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResultStateLoading value) loading,
    required TResult Function(_ResultStateData value) data,
    required TResult Function(_ResultStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResultStateLoading value)? loading,
    TResult? Function(_ResultStateData value)? data,
    TResult? Function(_ResultStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResultStateLoading value)? loading,
    TResult Function(_ResultStateData value)? data,
    TResult Function(_ResultStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultStateCopyWith<$Res> {
  factory $ResultStateCopyWith(
          ResultState value, $Res Function(ResultState) then) =
      _$ResultStateCopyWithImpl<$Res, ResultState>;
}

/// @nodoc
class _$ResultStateCopyWithImpl<$Res, $Val extends ResultState>
    implements $ResultStateCopyWith<$Res> {
  _$ResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ResultStateLoadingImplCopyWith<$Res> {
  factory _$$ResultStateLoadingImplCopyWith(_$ResultStateLoadingImpl value,
          $Res Function(_$ResultStateLoadingImpl) then) =
      __$$ResultStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResultStateLoadingImplCopyWithImpl<$Res>
    extends _$ResultStateCopyWithImpl<$Res, _$ResultStateLoadingImpl>
    implements _$$ResultStateLoadingImplCopyWith<$Res> {
  __$$ResultStateLoadingImplCopyWithImpl(_$ResultStateLoadingImpl _value,
      $Res Function(_$ResultStateLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResultStateLoadingImpl extends _ResultStateLoading {
  const _$ResultStateLoadingImpl() : super._();

  @override
  String toString() {
    return 'ResultState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResultStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int resultId) data,
    required TResult Function(AnyException error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int resultId)? data,
    TResult? Function(AnyException error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int resultId)? data,
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
    required TResult Function(_ResultStateLoading value) loading,
    required TResult Function(_ResultStateData value) data,
    required TResult Function(_ResultStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResultStateLoading value)? loading,
    TResult? Function(_ResultStateData value)? data,
    TResult? Function(_ResultStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResultStateLoading value)? loading,
    TResult Function(_ResultStateData value)? data,
    TResult Function(_ResultStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _ResultStateLoading extends ResultState {
  const factory _ResultStateLoading() = _$ResultStateLoadingImpl;
  const _ResultStateLoading._() : super._();
}

/// @nodoc
abstract class _$$ResultStateDataImplCopyWith<$Res> {
  factory _$$ResultStateDataImplCopyWith(_$ResultStateDataImpl value,
          $Res Function(_$ResultStateDataImpl) then) =
      __$$ResultStateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int resultId});
}

/// @nodoc
class __$$ResultStateDataImplCopyWithImpl<$Res>
    extends _$ResultStateCopyWithImpl<$Res, _$ResultStateDataImpl>
    implements _$$ResultStateDataImplCopyWith<$Res> {
  __$$ResultStateDataImplCopyWithImpl(
      _$ResultStateDataImpl _value, $Res Function(_$ResultStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? resultId = null,
  }) {
    return _then(_$ResultStateDataImpl(
      resultId: null == resultId
          ? _value.resultId
          : resultId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ResultStateDataImpl extends _ResultStateData {
  const _$ResultStateDataImpl({required this.resultId}) : super._();

  @override
  final int resultId;

  @override
  String toString() {
    return 'ResultState.data(resultId: $resultId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultStateDataImpl &&
            (identical(other.resultId, resultId) ||
                other.resultId == resultId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, resultId);

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultStateDataImplCopyWith<_$ResultStateDataImpl> get copyWith =>
      __$$ResultStateDataImplCopyWithImpl<_$ResultStateDataImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int resultId) data,
    required TResult Function(AnyException error) error,
  }) {
    return data(resultId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int resultId)? data,
    TResult? Function(AnyException error)? error,
  }) {
    return data?.call(resultId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int resultId)? data,
    TResult Function(AnyException error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(resultId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ResultStateLoading value) loading,
    required TResult Function(_ResultStateData value) data,
    required TResult Function(_ResultStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResultStateLoading value)? loading,
    TResult? Function(_ResultStateData value)? data,
    TResult? Function(_ResultStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResultStateLoading value)? loading,
    TResult Function(_ResultStateData value)? data,
    TResult Function(_ResultStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _ResultStateData extends ResultState {
  const factory _ResultStateData({required final int resultId}) =
      _$ResultStateDataImpl;
  const _ResultStateData._() : super._();

  int get resultId;

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultStateDataImplCopyWith<_$ResultStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResultStateErrorImplCopyWith<$Res> {
  factory _$$ResultStateErrorImplCopyWith(_$ResultStateErrorImpl value,
          $Res Function(_$ResultStateErrorImpl) then) =
      __$$ResultStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AnyException error});
}

/// @nodoc
class __$$ResultStateErrorImplCopyWithImpl<$Res>
    extends _$ResultStateCopyWithImpl<$Res, _$ResultStateErrorImpl>
    implements _$$ResultStateErrorImplCopyWith<$Res> {
  __$$ResultStateErrorImplCopyWithImpl(_$ResultStateErrorImpl _value,
      $Res Function(_$ResultStateErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ResultStateErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as AnyException,
    ));
  }
}

/// @nodoc

class _$ResultStateErrorImpl extends _ResultStateError {
  const _$ResultStateErrorImpl(this.error) : super._();

  @override
  final AnyException error;

  @override
  String toString() {
    return 'ResultState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultStateErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultStateErrorImplCopyWith<_$ResultStateErrorImpl> get copyWith =>
      __$$ResultStateErrorImplCopyWithImpl<_$ResultStateErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(int resultId) data,
    required TResult Function(AnyException error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(int resultId)? data,
    TResult? Function(AnyException error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(int resultId)? data,
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
    required TResult Function(_ResultStateLoading value) loading,
    required TResult Function(_ResultStateData value) data,
    required TResult Function(_ResultStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ResultStateLoading value)? loading,
    TResult? Function(_ResultStateData value)? data,
    TResult? Function(_ResultStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ResultStateLoading value)? loading,
    TResult Function(_ResultStateData value)? data,
    TResult Function(_ResultStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ResultStateError extends ResultState {
  const factory _ResultStateError(final AnyException error) =
      _$ResultStateErrorImpl;
  const _ResultStateError._() : super._();

  AnyException get error;

  /// Create a copy of ResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultStateErrorImplCopyWith<_$ResultStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
