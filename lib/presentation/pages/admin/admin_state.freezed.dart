// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdminState {

 List<Course>? get courses; Result? get loadResult; Result? get createResult; Result? get updateResult; Result? get deleteResult;
/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminStateCopyWith<AdminState> get copyWith => _$AdminStateCopyWithImpl<AdminState>(this as AdminState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminState&&const DeepCollectionEquality().equals(other.courses, courses)&&(identical(other.loadResult, loadResult) || other.loadResult == loadResult)&&(identical(other.createResult, createResult) || other.createResult == createResult)&&(identical(other.updateResult, updateResult) || other.updateResult == updateResult)&&(identical(other.deleteResult, deleteResult) || other.deleteResult == deleteResult));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(courses),loadResult,createResult,updateResult,deleteResult);

@override
String toString() {
  return 'AdminState(courses: $courses, loadResult: $loadResult, createResult: $createResult, updateResult: $updateResult, deleteResult: $deleteResult)';
}


}

/// @nodoc
abstract mixin class $AdminStateCopyWith<$Res>  {
  factory $AdminStateCopyWith(AdminState value, $Res Function(AdminState) _then) = _$AdminStateCopyWithImpl;
@useResult
$Res call({
 List<Course>? courses, Result? loadResult, Result? createResult, Result? updateResult, Result? deleteResult
});


$ResultCopyWith<dynamic, $Res>? get loadResult;$ResultCopyWith<dynamic, $Res>? get createResult;$ResultCopyWith<dynamic, $Res>? get updateResult;$ResultCopyWith<dynamic, $Res>? get deleteResult;

}
/// @nodoc
class _$AdminStateCopyWithImpl<$Res>
    implements $AdminStateCopyWith<$Res> {
  _$AdminStateCopyWithImpl(this._self, this._then);

  final AdminState _self;
  final $Res Function(AdminState) _then;

/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? courses = freezed,Object? loadResult = freezed,Object? createResult = freezed,Object? updateResult = freezed,Object? deleteResult = freezed,}) {
  return _then(_self.copyWith(
courses: freezed == courses ? _self.courses : courses // ignore: cast_nullable_to_non_nullable
as List<Course>?,loadResult: freezed == loadResult ? _self.loadResult : loadResult // ignore: cast_nullable_to_non_nullable
as Result?,createResult: freezed == createResult ? _self.createResult : createResult // ignore: cast_nullable_to_non_nullable
as Result?,updateResult: freezed == updateResult ? _self.updateResult : updateResult // ignore: cast_nullable_to_non_nullable
as Result?,deleteResult: freezed == deleteResult ? _self.deleteResult : deleteResult // ignore: cast_nullable_to_non_nullable
as Result?,
  ));
}
/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res>? get loadResult {
    if (_self.loadResult == null) {
    return null;
  }

  return $ResultCopyWith<dynamic, $Res>(_self.loadResult!, (value) {
    return _then(_self.copyWith(loadResult: value));
  });
}/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res>? get createResult {
    if (_self.createResult == null) {
    return null;
  }

  return $ResultCopyWith<dynamic, $Res>(_self.createResult!, (value) {
    return _then(_self.copyWith(createResult: value));
  });
}/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res>? get updateResult {
    if (_self.updateResult == null) {
    return null;
  }

  return $ResultCopyWith<dynamic, $Res>(_self.updateResult!, (value) {
    return _then(_self.copyWith(updateResult: value));
  });
}/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res>? get deleteResult {
    if (_self.deleteResult == null) {
    return null;
  }

  return $ResultCopyWith<dynamic, $Res>(_self.deleteResult!, (value) {
    return _then(_self.copyWith(deleteResult: value));
  });
}
}


/// Adds pattern-matching-related methods to [AdminState].
extension AdminStatePatterns on AdminState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminState value)  $default,){
final _that = this;
switch (_that) {
case _AdminState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminState value)?  $default,){
final _that = this;
switch (_that) {
case _AdminState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Course>? courses,  Result? loadResult,  Result? createResult,  Result? updateResult,  Result? deleteResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminState() when $default != null:
return $default(_that.courses,_that.loadResult,_that.createResult,_that.updateResult,_that.deleteResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Course>? courses,  Result? loadResult,  Result? createResult,  Result? updateResult,  Result? deleteResult)  $default,) {final _that = this;
switch (_that) {
case _AdminState():
return $default(_that.courses,_that.loadResult,_that.createResult,_that.updateResult,_that.deleteResult);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Course>? courses,  Result? loadResult,  Result? createResult,  Result? updateResult,  Result? deleteResult)?  $default,) {final _that = this;
switch (_that) {
case _AdminState() when $default != null:
return $default(_that.courses,_that.loadResult,_that.createResult,_that.updateResult,_that.deleteResult);case _:
  return null;

}
}

}

/// @nodoc


class _AdminState implements AdminState {
   _AdminState({final  List<Course>? courses, this.loadResult, this.createResult, this.updateResult, this.deleteResult}): _courses = courses;
  

 final  List<Course>? _courses;
@override List<Course>? get courses {
  final value = _courses;
  if (value == null) return null;
  if (_courses is EqualUnmodifiableListView) return _courses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Result? loadResult;
@override final  Result? createResult;
@override final  Result? updateResult;
@override final  Result? deleteResult;

/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminStateCopyWith<_AdminState> get copyWith => __$AdminStateCopyWithImpl<_AdminState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminState&&const DeepCollectionEquality().equals(other._courses, _courses)&&(identical(other.loadResult, loadResult) || other.loadResult == loadResult)&&(identical(other.createResult, createResult) || other.createResult == createResult)&&(identical(other.updateResult, updateResult) || other.updateResult == updateResult)&&(identical(other.deleteResult, deleteResult) || other.deleteResult == deleteResult));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_courses),loadResult,createResult,updateResult,deleteResult);

@override
String toString() {
  return 'AdminState(courses: $courses, loadResult: $loadResult, createResult: $createResult, updateResult: $updateResult, deleteResult: $deleteResult)';
}


}

/// @nodoc
abstract mixin class _$AdminStateCopyWith<$Res> implements $AdminStateCopyWith<$Res> {
  factory _$AdminStateCopyWith(_AdminState value, $Res Function(_AdminState) _then) = __$AdminStateCopyWithImpl;
@override @useResult
$Res call({
 List<Course>? courses, Result? loadResult, Result? createResult, Result? updateResult, Result? deleteResult
});


@override $ResultCopyWith<dynamic, $Res>? get loadResult;@override $ResultCopyWith<dynamic, $Res>? get createResult;@override $ResultCopyWith<dynamic, $Res>? get updateResult;@override $ResultCopyWith<dynamic, $Res>? get deleteResult;

}
/// @nodoc
class __$AdminStateCopyWithImpl<$Res>
    implements _$AdminStateCopyWith<$Res> {
  __$AdminStateCopyWithImpl(this._self, this._then);

  final _AdminState _self;
  final $Res Function(_AdminState) _then;

/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? courses = freezed,Object? loadResult = freezed,Object? createResult = freezed,Object? updateResult = freezed,Object? deleteResult = freezed,}) {
  return _then(_AdminState(
courses: freezed == courses ? _self._courses : courses // ignore: cast_nullable_to_non_nullable
as List<Course>?,loadResult: freezed == loadResult ? _self.loadResult : loadResult // ignore: cast_nullable_to_non_nullable
as Result?,createResult: freezed == createResult ? _self.createResult : createResult // ignore: cast_nullable_to_non_nullable
as Result?,updateResult: freezed == updateResult ? _self.updateResult : updateResult // ignore: cast_nullable_to_non_nullable
as Result?,deleteResult: freezed == deleteResult ? _self.deleteResult : deleteResult // ignore: cast_nullable_to_non_nullable
as Result?,
  ));
}

/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res>? get loadResult {
    if (_self.loadResult == null) {
    return null;
  }

  return $ResultCopyWith<dynamic, $Res>(_self.loadResult!, (value) {
    return _then(_self.copyWith(loadResult: value));
  });
}/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res>? get createResult {
    if (_self.createResult == null) {
    return null;
  }

  return $ResultCopyWith<dynamic, $Res>(_self.createResult!, (value) {
    return _then(_self.copyWith(createResult: value));
  });
}/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res>? get updateResult {
    if (_self.updateResult == null) {
    return null;
  }

  return $ResultCopyWith<dynamic, $Res>(_self.updateResult!, (value) {
    return _then(_self.copyWith(updateResult: value));
  });
}/// Create a copy of AdminState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResultCopyWith<dynamic, $Res>? get deleteResult {
    if (_self.deleteResult == null) {
    return null;
  }

  return $ResultCopyWith<dynamic, $Res>(_self.deleteResult!, (value) {
    return _then(_self.copyWith(deleteResult: value));
  });
}
}

// dart format on
