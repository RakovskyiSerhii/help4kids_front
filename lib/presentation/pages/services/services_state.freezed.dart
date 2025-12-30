// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'services_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServicesState {

 List<ServiceCategory>? get categories; List<Service>? get services; Result? get loadResult;
/// Create a copy of ServicesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServicesStateCopyWith<ServicesState> get copyWith => _$ServicesStateCopyWithImpl<ServicesState>(this as ServicesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServicesState&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.services, services)&&(identical(other.loadResult, loadResult) || other.loadResult == loadResult));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(services),loadResult);

@override
String toString() {
  return 'ServicesState(categories: $categories, services: $services, loadResult: $loadResult)';
}


}

/// @nodoc
abstract mixin class $ServicesStateCopyWith<$Res>  {
  factory $ServicesStateCopyWith(ServicesState value, $Res Function(ServicesState) _then) = _$ServicesStateCopyWithImpl;
@useResult
$Res call({
 List<ServiceCategory>? categories, List<Service>? services, Result? loadResult
});


$ResultCopyWith<dynamic, $Res>? get loadResult;

}
/// @nodoc
class _$ServicesStateCopyWithImpl<$Res>
    implements $ServicesStateCopyWith<$Res> {
  _$ServicesStateCopyWithImpl(this._self, this._then);

  final ServicesState _self;
  final $Res Function(ServicesState) _then;

/// Create a copy of ServicesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categories = freezed,Object? services = freezed,Object? loadResult = freezed,}) {
  return _then(_self.copyWith(
categories: freezed == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategory>?,services: freezed == services ? _self.services : services // ignore: cast_nullable_to_non_nullable
as List<Service>?,loadResult: freezed == loadResult ? _self.loadResult : loadResult // ignore: cast_nullable_to_non_nullable
as Result?,
  ));
}
/// Create a copy of ServicesState
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
}
}


/// Adds pattern-matching-related methods to [ServicesState].
extension ServicesStatePatterns on ServicesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServicesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServicesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServicesState value)  $default,){
final _that = this;
switch (_that) {
case _ServicesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServicesState value)?  $default,){
final _that = this;
switch (_that) {
case _ServicesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ServiceCategory>? categories,  List<Service>? services,  Result? loadResult)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServicesState() when $default != null:
return $default(_that.categories,_that.services,_that.loadResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ServiceCategory>? categories,  List<Service>? services,  Result? loadResult)  $default,) {final _that = this;
switch (_that) {
case _ServicesState():
return $default(_that.categories,_that.services,_that.loadResult);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ServiceCategory>? categories,  List<Service>? services,  Result? loadResult)?  $default,) {final _that = this;
switch (_that) {
case _ServicesState() when $default != null:
return $default(_that.categories,_that.services,_that.loadResult);case _:
  return null;

}
}

}

/// @nodoc


class _ServicesState implements ServicesState {
   _ServicesState({final  List<ServiceCategory>? categories, final  List<Service>? services, this.loadResult}): _categories = categories,_services = services;
  

 final  List<ServiceCategory>? _categories;
@override List<ServiceCategory>? get categories {
  final value = _categories;
  if (value == null) return null;
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Service>? _services;
@override List<Service>? get services {
  final value = _services;
  if (value == null) return null;
  if (_services is EqualUnmodifiableListView) return _services;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  Result? loadResult;

/// Create a copy of ServicesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServicesStateCopyWith<_ServicesState> get copyWith => __$ServicesStateCopyWithImpl<_ServicesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServicesState&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._services, _services)&&(identical(other.loadResult, loadResult) || other.loadResult == loadResult));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_services),loadResult);

@override
String toString() {
  return 'ServicesState(categories: $categories, services: $services, loadResult: $loadResult)';
}


}

/// @nodoc
abstract mixin class _$ServicesStateCopyWith<$Res> implements $ServicesStateCopyWith<$Res> {
  factory _$ServicesStateCopyWith(_ServicesState value, $Res Function(_ServicesState) _then) = __$ServicesStateCopyWithImpl;
@override @useResult
$Res call({
 List<ServiceCategory>? categories, List<Service>? services, Result? loadResult
});


@override $ResultCopyWith<dynamic, $Res>? get loadResult;

}
/// @nodoc
class __$ServicesStateCopyWithImpl<$Res>
    implements _$ServicesStateCopyWith<$Res> {
  __$ServicesStateCopyWithImpl(this._self, this._then);

  final _ServicesState _self;
  final $Res Function(_ServicesState) _then;

/// Create a copy of ServicesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categories = freezed,Object? services = freezed,Object? loadResult = freezed,}) {
  return _then(_ServicesState(
categories: freezed == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategory>?,services: freezed == services ? _self._services : services // ignore: cast_nullable_to_non_nullable
as List<Service>?,loadResult: freezed == loadResult ? _self.loadResult : loadResult // ignore: cast_nullable_to_non_nullable
as Result?,
  ));
}

/// Create a copy of ServicesState
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
}
}

// dart format on
