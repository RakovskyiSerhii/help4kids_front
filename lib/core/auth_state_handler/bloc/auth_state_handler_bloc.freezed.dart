// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state_handler_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthStateHandlerEvent {
  bool get isAuthorized => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAuthorized) toggleState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAuthorized)? toggleState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAuthorized)? toggleState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleState value) toggleState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleState value)? toggleState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleState value)? toggleState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of AuthStateHandlerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateHandlerEventCopyWith<AuthStateHandlerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateHandlerEventCopyWith<$Res> {
  factory $AuthStateHandlerEventCopyWith(AuthStateHandlerEvent value,
          $Res Function(AuthStateHandlerEvent) then) =
      _$AuthStateHandlerEventCopyWithImpl<$Res, AuthStateHandlerEvent>;
  @useResult
  $Res call({bool isAuthorized});
}

/// @nodoc
class _$AuthStateHandlerEventCopyWithImpl<$Res,
        $Val extends AuthStateHandlerEvent>
    implements $AuthStateHandlerEventCopyWith<$Res> {
  _$AuthStateHandlerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthStateHandlerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthorized = null,
  }) {
    return _then(_value.copyWith(
      isAuthorized: null == isAuthorized
          ? _value.isAuthorized
          : isAuthorized // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToggleStateImplCopyWith<$Res>
    implements $AuthStateHandlerEventCopyWith<$Res> {
  factory _$$ToggleStateImplCopyWith(
          _$ToggleStateImpl value, $Res Function(_$ToggleStateImpl) then) =
      __$$ToggleStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAuthorized});
}

/// @nodoc
class __$$ToggleStateImplCopyWithImpl<$Res>
    extends _$AuthStateHandlerEventCopyWithImpl<$Res, _$ToggleStateImpl>
    implements _$$ToggleStateImplCopyWith<$Res> {
  __$$ToggleStateImplCopyWithImpl(
      _$ToggleStateImpl _value, $Res Function(_$ToggleStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthStateHandlerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthorized = null,
  }) {
    return _then(_$ToggleStateImpl(
      null == isAuthorized
          ? _value.isAuthorized
          : isAuthorized // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToggleStateImpl implements _ToggleState {
  const _$ToggleStateImpl(this.isAuthorized);

  @override
  final bool isAuthorized;

  @override
  String toString() {
    return 'AuthStateHandlerEvent.toggleState(isAuthorized: $isAuthorized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToggleStateImpl &&
            (identical(other.isAuthorized, isAuthorized) ||
                other.isAuthorized == isAuthorized));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAuthorized);

  /// Create a copy of AuthStateHandlerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ToggleStateImplCopyWith<_$ToggleStateImpl> get copyWith =>
      __$$ToggleStateImplCopyWithImpl<_$ToggleStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isAuthorized) toggleState,
  }) {
    return toggleState(isAuthorized);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isAuthorized)? toggleState,
  }) {
    return toggleState?.call(isAuthorized);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isAuthorized)? toggleState,
    required TResult orElse(),
  }) {
    if (toggleState != null) {
      return toggleState(isAuthorized);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleState value) toggleState,
  }) {
    return toggleState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleState value)? toggleState,
  }) {
    return toggleState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleState value)? toggleState,
    required TResult orElse(),
  }) {
    if (toggleState != null) {
      return toggleState(this);
    }
    return orElse();
  }
}

abstract class _ToggleState implements AuthStateHandlerEvent {
  const factory _ToggleState(final bool isAuthorized) = _$ToggleStateImpl;

  @override
  bool get isAuthorized;

  /// Create a copy of AuthStateHandlerEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ToggleStateImplCopyWith<_$ToggleStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthStateHandlerState {
  bool get isAuthorized => throw _privateConstructorUsedError;

  /// Create a copy of AuthStateHandlerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthStateHandlerStateCopyWith<AuthStateHandlerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateHandlerStateCopyWith<$Res> {
  factory $AuthStateHandlerStateCopyWith(AuthStateHandlerState value,
          $Res Function(AuthStateHandlerState) then) =
      _$AuthStateHandlerStateCopyWithImpl<$Res, AuthStateHandlerState>;
  @useResult
  $Res call({bool isAuthorized});
}

/// @nodoc
class _$AuthStateHandlerStateCopyWithImpl<$Res,
        $Val extends AuthStateHandlerState>
    implements $AuthStateHandlerStateCopyWith<$Res> {
  _$AuthStateHandlerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthStateHandlerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthorized = null,
  }) {
    return _then(_value.copyWith(
      isAuthorized: null == isAuthorized
          ? _value.isAuthorized
          : isAuthorized // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthStateHandlerStateImplCopyWith<$Res>
    implements $AuthStateHandlerStateCopyWith<$Res> {
  factory _$$AuthStateHandlerStateImplCopyWith(
          _$AuthStateHandlerStateImpl value,
          $Res Function(_$AuthStateHandlerStateImpl) then) =
      __$$AuthStateHandlerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isAuthorized});
}

/// @nodoc
class __$$AuthStateHandlerStateImplCopyWithImpl<$Res>
    extends _$AuthStateHandlerStateCopyWithImpl<$Res,
        _$AuthStateHandlerStateImpl>
    implements _$$AuthStateHandlerStateImplCopyWith<$Res> {
  __$$AuthStateHandlerStateImplCopyWithImpl(_$AuthStateHandlerStateImpl _value,
      $Res Function(_$AuthStateHandlerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthStateHandlerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isAuthorized = null,
  }) {
    return _then(_$AuthStateHandlerStateImpl(
      isAuthorized: null == isAuthorized
          ? _value.isAuthorized
          : isAuthorized // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AuthStateHandlerStateImpl implements _AuthStateHandlerState {
  const _$AuthStateHandlerStateImpl({required this.isAuthorized});

  @override
  final bool isAuthorized;

  @override
  String toString() {
    return 'AuthStateHandlerState(isAuthorized: $isAuthorized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateHandlerStateImpl &&
            (identical(other.isAuthorized, isAuthorized) ||
                other.isAuthorized == isAuthorized));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isAuthorized);

  /// Create a copy of AuthStateHandlerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateHandlerStateImplCopyWith<_$AuthStateHandlerStateImpl>
      get copyWith => __$$AuthStateHandlerStateImplCopyWithImpl<
          _$AuthStateHandlerStateImpl>(this, _$identity);
}

abstract class _AuthStateHandlerState implements AuthStateHandlerState {
  const factory _AuthStateHandlerState({required final bool isAuthorized}) =
      _$AuthStateHandlerStateImpl;

  @override
  bool get isAuthorized;

  /// Create a copy of AuthStateHandlerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateHandlerStateImplCopyWith<_$AuthStateHandlerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
