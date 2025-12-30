// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_contact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialContact {

 String get id; String get url; String get name;
/// Create a copy of SocialContact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialContactCopyWith<SocialContact> get copyWith => _$SocialContactCopyWithImpl<SocialContact>(this as SocialContact, _$identity);

  /// Serializes this SocialContact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialContact&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,name);

@override
String toString() {
  return 'SocialContact(id: $id, url: $url, name: $name)';
}


}

/// @nodoc
abstract mixin class $SocialContactCopyWith<$Res>  {
  factory $SocialContactCopyWith(SocialContact value, $Res Function(SocialContact) _then) = _$SocialContactCopyWithImpl;
@useResult
$Res call({
 String id, String url, String name
});




}
/// @nodoc
class _$SocialContactCopyWithImpl<$Res>
    implements $SocialContactCopyWith<$Res> {
  _$SocialContactCopyWithImpl(this._self, this._then);

  final SocialContact _self;
  final $Res Function(SocialContact) _then;

/// Create a copy of SocialContact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? url = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SocialContact].
extension SocialContactPatterns on SocialContact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SocialContact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocialContact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SocialContact value)  $default,){
final _that = this;
switch (_that) {
case _SocialContact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SocialContact value)?  $default,){
final _that = this;
switch (_that) {
case _SocialContact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String url,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SocialContact() when $default != null:
return $default(_that.id,_that.url,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String url,  String name)  $default,) {final _that = this;
switch (_that) {
case _SocialContact():
return $default(_that.id,_that.url,_that.name);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String url,  String name)?  $default,) {final _that = this;
switch (_that) {
case _SocialContact() when $default != null:
return $default(_that.id,_that.url,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SocialContact implements SocialContact {
  const _SocialContact({required this.id, required this.url, required this.name});
  factory _SocialContact.fromJson(Map<String, dynamic> json) => _$SocialContactFromJson(json);

@override final  String id;
@override final  String url;
@override final  String name;

/// Create a copy of SocialContact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialContactCopyWith<_SocialContact> get copyWith => __$SocialContactCopyWithImpl<_SocialContact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialContact&&(identical(other.id, id) || other.id == id)&&(identical(other.url, url) || other.url == url)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,url,name);

@override
String toString() {
  return 'SocialContact(id: $id, url: $url, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SocialContactCopyWith<$Res> implements $SocialContactCopyWith<$Res> {
  factory _$SocialContactCopyWith(_SocialContact value, $Res Function(_SocialContact) _then) = __$SocialContactCopyWithImpl;
@override @useResult
$Res call({
 String id, String url, String name
});




}
/// @nodoc
class __$SocialContactCopyWithImpl<$Res>
    implements _$SocialContactCopyWith<$Res> {
  __$SocialContactCopyWithImpl(this._self, this._then);

  final _SocialContact _self;
  final $Res Function(_SocialContact) _then;

/// Create a copy of SocialContact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? url = null,Object? name = null,}) {
  return _then(_SocialContact(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
