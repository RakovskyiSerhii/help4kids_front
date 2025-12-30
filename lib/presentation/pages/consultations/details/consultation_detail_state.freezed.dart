// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ConsultationDetailState {

 Consultation? get consultation; Result? get loadingResult;
/// Create a copy of ConsultationDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationDetailStateCopyWith<ConsultationDetailState> get copyWith => _$ConsultationDetailStateCopyWithImpl<ConsultationDetailState>(this as ConsultationDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationDetailState&&(identical(other.consultation, consultation) || other.consultation == consultation)&&(identical(other.loadingResult, loadingResult) || other.loadingResult == loadingResult));
}


@override
int get hashCode => Object.hash(runtimeType,consultation,loadingResult);

@override
String toString() {
  return 'ConsultationDetailState(consultation: $consultation, loadingResult: $loadingResult)';
}


}

/// @nodoc
abstract mixin class $ConsultationDetailStateCopyWith<$Res>  {
  factory $ConsultationDetailStateCopyWith(ConsultationDetailState value, $Res Function(ConsultationDetailState) _then) = _$ConsultationDetailStateCopyWithImpl;
@useResult
$Res call({
 Consultation? consultation, Result? loadingResult
});


$ConsultationCopyWith<$Res>? get consultation;$ResultCopyWith<dynamic, $Res>? get loadingResult;

}
/// @nodoc
class _$ConsultationDetailStateCopyWithImpl<$Res>
    implements $ConsultationDetailStateCopyWith<$Res> {
  _$ConsultationDetailStateCopyWithImpl(this._self, this._then);

  final ConsultationDetailState _self;
  final $Res Function(ConsultationDetailState) _then;

/// Create a copy of ConsultationDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? consultation = freezed,Object? loadingResult = freezed,}) {
  return _then(_self.copyWith(
consultation: freezed == consultation ? _self.consultation : consultation // ignore: cast_nullable_to_non_nullable
as Consultation?,loadingResult: freezed == loadingResult ? _self.loadingResult : loadingResult // ignore: cast_nullable_to_non_nullable
as Result?,
  ));
}
/// Create a copy of ConsultationDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsultationCopyWith<$Res>? get consultation {
    if (_self.consultation == null) {
    return null;
  }

  return $ConsultationCopyWith<$Res>(_self.consultation!, (value) {
    return _then(_self.copyWith(consultation: value));
  });
}/// Create a copy of ConsultationDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res>? get loadingResult {
    if (_self.loadingResult == null) {
    return null;
  }

  return $ResultCopyWith<dynamic, $Res>(_self.loadingResult!, (value) {
    return _then(_self.copyWith(loadingResult: value));
  });
}
}


/// Adds pattern-matching-related methods to [ConsultationDetailState].
extension ConsultationDetailStatePatterns on ConsultationDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsultationDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsultationDetailState value)  $default,){
final _that = this;
switch (_that) {
case _ConsultationDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsultationDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _ConsultationDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Consultation? consultation,  Result? loadingResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationDetailState() when $default != null:
return $default(_that.consultation,_that.loadingResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Consultation? consultation,  Result? loadingResult)  $default,) {final _that = this;
switch (_that) {
case _ConsultationDetailState():
return $default(_that.consultation,_that.loadingResult);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Consultation? consultation,  Result? loadingResult)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationDetailState() when $default != null:
return $default(_that.consultation,_that.loadingResult);case _:
  return null;

}
}

}

/// @nodoc


class _ConsultationDetailState implements ConsultationDetailState {
   _ConsultationDetailState({this.consultation, this.loadingResult});
  

@override final  Consultation? consultation;
@override final  Result? loadingResult;

/// Create a copy of ConsultationDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationDetailStateCopyWith<_ConsultationDetailState> get copyWith => __$ConsultationDetailStateCopyWithImpl<_ConsultationDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationDetailState&&(identical(other.consultation, consultation) || other.consultation == consultation)&&(identical(other.loadingResult, loadingResult) || other.loadingResult == loadingResult));
}


@override
int get hashCode => Object.hash(runtimeType,consultation,loadingResult);

@override
String toString() {
  return 'ConsultationDetailState(consultation: $consultation, loadingResult: $loadingResult)';
}


}

/// @nodoc
abstract mixin class _$ConsultationDetailStateCopyWith<$Res> implements $ConsultationDetailStateCopyWith<$Res> {
  factory _$ConsultationDetailStateCopyWith(_ConsultationDetailState value, $Res Function(_ConsultationDetailState) _then) = __$ConsultationDetailStateCopyWithImpl;
@override @useResult
$Res call({
 Consultation? consultation, Result? loadingResult
});


@override $ConsultationCopyWith<$Res>? get consultation;@override $ResultCopyWith<dynamic, $Res>? get loadingResult;

}
/// @nodoc
class __$ConsultationDetailStateCopyWithImpl<$Res>
    implements _$ConsultationDetailStateCopyWith<$Res> {
  __$ConsultationDetailStateCopyWithImpl(this._self, this._then);

  final _ConsultationDetailState _self;
  final $Res Function(_ConsultationDetailState) _then;

/// Create a copy of ConsultationDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? consultation = freezed,Object? loadingResult = freezed,}) {
  return _then(_ConsultationDetailState(
consultation: freezed == consultation ? _self.consultation : consultation // ignore: cast_nullable_to_non_nullable
as Consultation?,loadingResult: freezed == loadingResult ? _self.loadingResult : loadingResult // ignore: cast_nullable_to_non_nullable
as Result?,
  ));
}

/// Create a copy of ConsultationDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsultationCopyWith<$Res>? get consultation {
    if (_self.consultation == null) {
    return null;
  }

  return $ConsultationCopyWith<$Res>(_self.consultation!, (value) {
    return _then(_self.copyWith(consultation: value));
  });
}/// Create a copy of ConsultationDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res>? get loadingResult {
    if (_self.loadingResult == null) {
    return null;
  }

  return $ResultCopyWith<dynamic, $Res>(_self.loadingResult!, (value) {
    return _then(_self.copyWith(loadingResult: value));
  });
}
}

// dart format on
