// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ArticleCategory {

 String get id; String get title; String? get description; bool get featured; DateTime get createdAt; DateTime get updatedAt;
/// Create a copy of ArticleCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArticleCategoryCopyWith<ArticleCategory> get copyWith => _$ArticleCategoryCopyWithImpl<ArticleCategory>(this as ArticleCategory, _$identity);

  /// Serializes this ArticleCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArticleCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.featured, featured) || other.featured == featured)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,featured,createdAt,updatedAt);

@override
String toString() {
  return 'ArticleCategory(id: $id, title: $title, description: $description, featured: $featured, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $ArticleCategoryCopyWith<$Res>  {
  factory $ArticleCategoryCopyWith(ArticleCategory value, $Res Function(ArticleCategory) _then) = _$ArticleCategoryCopyWithImpl;
@useResult
$Res call({
 String id, String title, String? description, bool featured, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class _$ArticleCategoryCopyWithImpl<$Res>
    implements $ArticleCategoryCopyWith<$Res> {
  _$ArticleCategoryCopyWithImpl(this._self, this._then);

  final ArticleCategory _self;
  final $Res Function(ArticleCategory) _then;

/// Create a copy of ArticleCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? featured = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,featured: null == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ArticleCategory].
extension ArticleCategoryPatterns on ArticleCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArticleCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArticleCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArticleCategory value)  $default,){
final _that = this;
switch (_that) {
case _ArticleCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArticleCategory value)?  $default,){
final _that = this;
switch (_that) {
case _ArticleCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  bool featured,  DateTime createdAt,  DateTime updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArticleCategory() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.featured,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String? description,  bool featured,  DateTime createdAt,  DateTime updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ArticleCategory():
return $default(_that.id,_that.title,_that.description,_that.featured,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String? description,  bool featured,  DateTime createdAt,  DateTime updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ArticleCategory() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.featured,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ArticleCategory implements ArticleCategory {
  const _ArticleCategory({required this.id, required this.title, this.description, this.featured = false, required this.createdAt, required this.updatedAt});
  factory _ArticleCategory.fromJson(Map<String, dynamic> json) => _$ArticleCategoryFromJson(json);

@override final  String id;
@override final  String title;
@override final  String? description;
@override@JsonKey() final  bool featured;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;

/// Create a copy of ArticleCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArticleCategoryCopyWith<_ArticleCategory> get copyWith => __$ArticleCategoryCopyWithImpl<_ArticleCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ArticleCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArticleCategory&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.featured, featured) || other.featured == featured)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,featured,createdAt,updatedAt);

@override
String toString() {
  return 'ArticleCategory(id: $id, title: $title, description: $description, featured: $featured, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ArticleCategoryCopyWith<$Res> implements $ArticleCategoryCopyWith<$Res> {
  factory _$ArticleCategoryCopyWith(_ArticleCategory value, $Res Function(_ArticleCategory) _then) = __$ArticleCategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String? description, bool featured, DateTime createdAt, DateTime updatedAt
});




}
/// @nodoc
class __$ArticleCategoryCopyWithImpl<$Res>
    implements _$ArticleCategoryCopyWith<$Res> {
  __$ArticleCategoryCopyWithImpl(this._self, this._then);

  final _ArticleCategory _self;
  final $Res Function(_ArticleCategory) _then;

/// Create a copy of ArticleCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = freezed,Object? featured = null,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_ArticleCategory(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,featured: null == featured ? _self.featured : featured // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
