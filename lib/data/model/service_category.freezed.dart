// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServiceCategory {

 String get id; String get name; String? get description; String? get iconUrl;
/// Create a copy of ServiceCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServiceCategoryCopyWith<ServiceCategory> get copyWith => _$ServiceCategoryCopyWithImpl<ServiceCategory>(this as ServiceCategory, _$identity);

  /// Serializes this ServiceCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServiceCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,iconUrl);

@override
String toString() {
  return 'ServiceCategory(id: $id, name: $name, description: $description, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class $ServiceCategoryCopyWith<$Res>  {
  factory $ServiceCategoryCopyWith(ServiceCategory value, $Res Function(ServiceCategory) _then) = _$ServiceCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? description, String? iconUrl
});




}
/// @nodoc
class _$ServiceCategoryCopyWithImpl<$Res>
    implements $ServiceCategoryCopyWith<$Res> {
  _$ServiceCategoryCopyWithImpl(this._self, this._then);

  final ServiceCategory _self;
  final $Res Function(ServiceCategory) _then;

/// Create a copy of ServiceCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? iconUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServiceCategory].
extension ServiceCategoryPatterns on ServiceCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServiceCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServiceCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServiceCategory value)  $default,){
final _that = this;
switch (_that) {
case _ServiceCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServiceCategory value)?  $default,){
final _that = this;
switch (_that) {
case _ServiceCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? iconUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServiceCategory() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.iconUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String? description,  String? iconUrl)  $default,) {final _that = this;
switch (_that) {
case _ServiceCategory():
return $default(_that.id,_that.name,_that.description,_that.iconUrl);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String? description,  String? iconUrl)?  $default,) {final _that = this;
switch (_that) {
case _ServiceCategory() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.iconUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServiceCategory implements ServiceCategory {
   _ServiceCategory({required this.id, required this.name, this.description, this.iconUrl});
  factory _ServiceCategory.fromJson(Map<String, dynamic> json) => _$ServiceCategoryFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? description;
@override final  String? iconUrl;

/// Create a copy of ServiceCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServiceCategoryCopyWith<_ServiceCategory> get copyWith => __$ServiceCategoryCopyWithImpl<_ServiceCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServiceCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,iconUrl);

@override
String toString() {
  return 'ServiceCategory(id: $id, name: $name, description: $description, iconUrl: $iconUrl)';
}


}

/// @nodoc
abstract mixin class _$ServiceCategoryCopyWith<$Res> implements $ServiceCategoryCopyWith<$Res> {
  factory _$ServiceCategoryCopyWith(_ServiceCategory value, $Res Function(_ServiceCategory) _then) = __$ServiceCategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? description, String? iconUrl
});




}
/// @nodoc
class __$ServiceCategoryCopyWithImpl<$Res>
    implements _$ServiceCategoryCopyWith<$Res> {
  __$ServiceCategoryCopyWithImpl(this._self, this._then);

  final _ServiceCategory _self;
  final $Res Function(_ServiceCategory) _then;

/// Create a copy of ServiceCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? iconUrl = freezed,}) {
  return _then(_ServiceCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
