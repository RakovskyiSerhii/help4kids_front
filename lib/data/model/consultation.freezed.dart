// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Consultation {

 String get id; String get title; String? get shortDescription; String? get description; double get price; String? get duration; Map<String, dynamic>? get question; bool get featured; DateTime get createdAt; DateTime get updatedAt; String? get createdBy; String? get updatedBy;
/// Create a copy of Consultation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationCopyWith<Consultation> get copyWith => _$ConsultationCopyWithImpl<Consultation>(this as Consultation, _$identity);

  /// Serializes this Consultation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Consultation&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other.question, question)&&(identical(other.featured, featured) || other.featured == featured)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,shortDescription,description,price,duration,const DeepCollectionEquality().hash(question),featured,createdAt,updatedAt,createdBy,updatedBy);

@override
String toString() {
  return 'Consultation(id: $id, title: $title, shortDescription: $shortDescription, description: $description, price: $price, duration: $duration, question: $question, featured: $featured, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class $ConsultationCopyWith<$Res>  {
  factory $ConsultationCopyWith(Consultation value, $Res Function(Consultation) _then) = _$ConsultationCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? shortDescription, String? description, double price, String? duration, Map<String, dynamic>? question, bool featured, DateTime createdAt, DateTime updatedAt, String? createdBy, String? updatedBy
});




}
/// @nodoc
class _$ConsultationCopyWithImpl<$Res>
    implements $ConsultationCopyWith<$Res> {
  _$ConsultationCopyWithImpl(this._self, this._then);

  final Consultation _self;
  final $Res Function(Consultation) _then;

/// Create a copy of Consultation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? shortDescription = freezed,Object? description = freezed,Object? price = null,Object? duration = freezed,Object? question = freezed,Object? featured = null,Object? createdAt = null,Object? updatedAt = null,Object? createdBy = freezed,Object? updatedBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,question: freezed == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,featured: null == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Consultation].
extension ConsultationPatterns on Consultation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Consultation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Consultation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Consultation value)  $default,){
final _that = this;
switch (_that) {
case _Consultation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Consultation value)?  $default,){
final _that = this;
switch (_that) {
case _Consultation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? shortDescription,  String? description,  double price,  String? duration,  Map<String, dynamic>? question,  bool featured,  DateTime createdAt,  DateTime updatedAt,  String? createdBy,  String? updatedBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Consultation() when $default != null:
return $default(_that.id,_that.title,_that.shortDescription,_that.description,_that.price,_that.duration,_that.question,_that.featured,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? shortDescription,  String? description,  double price,  String? duration,  Map<String, dynamic>? question,  bool featured,  DateTime createdAt,  DateTime updatedAt,  String? createdBy,  String? updatedBy)  $default,) {final _that = this;
switch (_that) {
case _Consultation():
return $default(_that.id,_that.title,_that.shortDescription,_that.description,_that.price,_that.duration,_that.question,_that.featured,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? shortDescription,  String? description,  double price,  String? duration,  Map<String, dynamic>? question,  bool featured,  DateTime createdAt,  DateTime updatedAt,  String? createdBy,  String? updatedBy)?  $default,) {final _that = this;
switch (_that) {
case _Consultation() when $default != null:
return $default(_that.id,_that.title,_that.shortDescription,_that.description,_that.price,_that.duration,_that.question,_that.featured,_that.createdAt,_that.updatedAt,_that.createdBy,_that.updatedBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Consultation implements Consultation {
  const _Consultation({required this.id, required this.title, this.shortDescription, this.description, required this.price, this.duration, final  Map<String, dynamic>? question, this.featured = false, required this.createdAt, required this.updatedAt, this.createdBy, this.updatedBy}): _question = question;
  factory _Consultation.fromJson(Map<String, dynamic> json) => _$ConsultationFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? shortDescription;
@override final  String? description;
@override final  double price;
@override final  String? duration;
 final  Map<String, dynamic>? _question;
@override Map<String, dynamic>? get question {
  final value = _question;
  if (value == null) return null;
  if (_question is EqualUnmodifiableMapView) return _question;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey() final  bool featured;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  String? createdBy;
@override final  String? updatedBy;

/// Create a copy of Consultation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationCopyWith<_Consultation> get copyWith => __$ConsultationCopyWithImpl<_Consultation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsultationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Consultation&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.shortDescription, shortDescription) || other.shortDescription == shortDescription)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.duration, duration) || other.duration == duration)&&const DeepCollectionEquality().equals(other._question, _question)&&(identical(other.featured, featured) || other.featured == featured)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.updatedBy, updatedBy) || other.updatedBy == updatedBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,shortDescription,description,price,duration,const DeepCollectionEquality().hash(_question),featured,createdAt,updatedAt,createdBy,updatedBy);

@override
String toString() {
  return 'Consultation(id: $id, title: $title, shortDescription: $shortDescription, description: $description, price: $price, duration: $duration, question: $question, featured: $featured, createdAt: $createdAt, updatedAt: $updatedAt, createdBy: $createdBy, updatedBy: $updatedBy)';
}


}

/// @nodoc
abstract mixin class _$ConsultationCopyWith<$Res> implements $ConsultationCopyWith<$Res> {
  factory _$ConsultationCopyWith(_Consultation value, $Res Function(_Consultation) _then) = __$ConsultationCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? shortDescription, String? description, double price, String? duration, Map<String, dynamic>? question, bool featured, DateTime createdAt, DateTime updatedAt, String? createdBy, String? updatedBy
});




}
/// @nodoc
class __$ConsultationCopyWithImpl<$Res>
    implements _$ConsultationCopyWith<$Res> {
  __$ConsultationCopyWithImpl(this._self, this._then);

  final _Consultation _self;
  final $Res Function(_Consultation) _then;

/// Create a copy of Consultation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? shortDescription = freezed,Object? description = freezed,Object? price = null,Object? duration = freezed,Object? question = freezed,Object? featured = null,Object? createdAt = null,Object? updatedAt = null,Object? createdBy = freezed,Object? updatedBy = freezed,}) {
  return _then(_Consultation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,shortDescription: freezed == shortDescription ? _self.shortDescription : shortDescription // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String?,question: freezed == question ? _self._question : question // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,featured: null == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,updatedBy: freezed == updatedBy ? _self.updatedBy : updatedBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
