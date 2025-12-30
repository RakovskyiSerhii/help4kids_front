// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state_handler_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthStateHandlerEvent {

 bool get isAuthorized;
/// Create a copy of AuthStateHandlerEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateHandlerEventCopyWith<AuthStateHandlerEvent> get copyWith => _$AuthStateHandlerEventCopyWithImpl<AuthStateHandlerEvent>(this as AuthStateHandlerEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateHandlerEvent&&(identical(other.isAuthorized, isAuthorized) || other.isAuthorized == isAuthorized));
}


@override
int get hashCode => Object.hash(runtimeType,isAuthorized);

@override
String toString() {
  return 'AuthStateHandlerEvent(isAuthorized: $isAuthorized)';
}


}

/// @nodoc
abstract mixin class $AuthStateHandlerEventCopyWith<$Res>  {
  factory $AuthStateHandlerEventCopyWith(AuthStateHandlerEvent value, $Res Function(AuthStateHandlerEvent) _then) = _$AuthStateHandlerEventCopyWithImpl;
@useResult
$Res call({
 bool isAuthorized
});




}
/// @nodoc
class _$AuthStateHandlerEventCopyWithImpl<$Res>
    implements $AuthStateHandlerEventCopyWith<$Res> {
  _$AuthStateHandlerEventCopyWithImpl(this._self, this._then);

  final AuthStateHandlerEvent _self;
  final $Res Function(AuthStateHandlerEvent) _then;

/// Create a copy of AuthStateHandlerEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAuthorized = null,}) {
  return _then(_self.copyWith(
isAuthorized: null == isAuthorized ? _self.isAuthorized : isAuthorized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthStateHandlerEvent].
extension AuthStateHandlerEventPatterns on AuthStateHandlerEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ToggleState value)?  toggleState,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ToggleState() when toggleState != null:
return toggleState(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ToggleState value)  toggleState,}){
final _that = this;
switch (_that) {
case _ToggleState():
return toggleState(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ToggleState value)?  toggleState,}){
final _that = this;
switch (_that) {
case _ToggleState() when toggleState != null:
return toggleState(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isAuthorized)?  toggleState,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ToggleState() when toggleState != null:
return toggleState(_that.isAuthorized);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isAuthorized)  toggleState,}) {final _that = this;
switch (_that) {
case _ToggleState():
return toggleState(_that.isAuthorized);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isAuthorized)?  toggleState,}) {final _that = this;
switch (_that) {
case _ToggleState() when toggleState != null:
return toggleState(_that.isAuthorized);case _:
  return null;

}
}

}

/// @nodoc


class _ToggleState implements AuthStateHandlerEvent {
  const _ToggleState(this.isAuthorized);
  

@override final  bool isAuthorized;

/// Create a copy of AuthStateHandlerEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ToggleStateCopyWith<_ToggleState> get copyWith => __$ToggleStateCopyWithImpl<_ToggleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ToggleState&&(identical(other.isAuthorized, isAuthorized) || other.isAuthorized == isAuthorized));
}


@override
int get hashCode => Object.hash(runtimeType,isAuthorized);

@override
String toString() {
  return 'AuthStateHandlerEvent.toggleState(isAuthorized: $isAuthorized)';
}


}

/// @nodoc
abstract mixin class _$ToggleStateCopyWith<$Res> implements $AuthStateHandlerEventCopyWith<$Res> {
  factory _$ToggleStateCopyWith(_ToggleState value, $Res Function(_ToggleState) _then) = __$ToggleStateCopyWithImpl;
@override @useResult
$Res call({
 bool isAuthorized
});




}
/// @nodoc
class __$ToggleStateCopyWithImpl<$Res>
    implements _$ToggleStateCopyWith<$Res> {
  __$ToggleStateCopyWithImpl(this._self, this._then);

  final _ToggleState _self;
  final $Res Function(_ToggleState) _then;

/// Create a copy of AuthStateHandlerEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAuthorized = null,}) {
  return _then(_ToggleState(
null == isAuthorized ? _self.isAuthorized : isAuthorized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc
mixin _$AuthStateHandlerState {

 bool get isAuthorized;
/// Create a copy of AuthStateHandlerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthStateHandlerStateCopyWith<AuthStateHandlerState> get copyWith => _$AuthStateHandlerStateCopyWithImpl<AuthStateHandlerState>(this as AuthStateHandlerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStateHandlerState&&(identical(other.isAuthorized, isAuthorized) || other.isAuthorized == isAuthorized));
}


@override
int get hashCode => Object.hash(runtimeType,isAuthorized);

@override
String toString() {
  return 'AuthStateHandlerState(isAuthorized: $isAuthorized)';
}


}

/// @nodoc
abstract mixin class $AuthStateHandlerStateCopyWith<$Res>  {
  factory $AuthStateHandlerStateCopyWith(AuthStateHandlerState value, $Res Function(AuthStateHandlerState) _then) = _$AuthStateHandlerStateCopyWithImpl;
@useResult
$Res call({
 bool isAuthorized
});




}
/// @nodoc
class _$AuthStateHandlerStateCopyWithImpl<$Res>
    implements $AuthStateHandlerStateCopyWith<$Res> {
  _$AuthStateHandlerStateCopyWithImpl(this._self, this._then);

  final AuthStateHandlerState _self;
  final $Res Function(AuthStateHandlerState) _then;

/// Create a copy of AuthStateHandlerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isAuthorized = null,}) {
  return _then(_self.copyWith(
isAuthorized: null == isAuthorized ? _self.isAuthorized : isAuthorized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthStateHandlerState].
extension AuthStateHandlerStatePatterns on AuthStateHandlerState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthStateHandlerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthStateHandlerState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthStateHandlerState value)  $default,){
final _that = this;
switch (_that) {
case _AuthStateHandlerState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthStateHandlerState value)?  $default,){
final _that = this;
switch (_that) {
case _AuthStateHandlerState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isAuthorized)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthStateHandlerState() when $default != null:
return $default(_that.isAuthorized);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isAuthorized)  $default,) {final _that = this;
switch (_that) {
case _AuthStateHandlerState():
return $default(_that.isAuthorized);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isAuthorized)?  $default,) {final _that = this;
switch (_that) {
case _AuthStateHandlerState() when $default != null:
return $default(_that.isAuthorized);case _:
  return null;

}
}

}

/// @nodoc


class _AuthStateHandlerState implements AuthStateHandlerState {
  const _AuthStateHandlerState({required this.isAuthorized});
  

@override final  bool isAuthorized;

/// Create a copy of AuthStateHandlerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthStateHandlerStateCopyWith<_AuthStateHandlerState> get copyWith => __$AuthStateHandlerStateCopyWithImpl<_AuthStateHandlerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthStateHandlerState&&(identical(other.isAuthorized, isAuthorized) || other.isAuthorized == isAuthorized));
}


@override
int get hashCode => Object.hash(runtimeType,isAuthorized);

@override
String toString() {
  return 'AuthStateHandlerState(isAuthorized: $isAuthorized)';
}


}

/// @nodoc
abstract mixin class _$AuthStateHandlerStateCopyWith<$Res> implements $AuthStateHandlerStateCopyWith<$Res> {
  factory _$AuthStateHandlerStateCopyWith(_AuthStateHandlerState value, $Res Function(_AuthStateHandlerState) _then) = __$AuthStateHandlerStateCopyWithImpl;
@override @useResult
$Res call({
 bool isAuthorized
});




}
/// @nodoc
class __$AuthStateHandlerStateCopyWithImpl<$Res>
    implements _$AuthStateHandlerStateCopyWith<$Res> {
  __$AuthStateHandlerStateCopyWithImpl(this._self, this._then);

  final _AuthStateHandlerState _self;
  final $Res Function(_AuthStateHandlerState) _then;

/// Create a copy of AuthStateHandlerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isAuthorized = null,}) {
  return _then(_AuthStateHandlerState(
isAuthorized: null == isAuthorized ? _self.isAuthorized : isAuthorized // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
