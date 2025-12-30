// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'landing.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LandingResponse {

 List<ServiceCategory> get featuredServices; List<Staff> get featuredStaff; List<Consultation> get featuredConsultations; List<Article> get featuredArticles;
/// Create a copy of LandingResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LandingResponseCopyWith<LandingResponse> get copyWith => _$LandingResponseCopyWithImpl<LandingResponse>(this as LandingResponse, _$identity);

  /// Serializes this LandingResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LandingResponse&&const DeepCollectionEquality().equals(other.featuredServices, featuredServices)&&const DeepCollectionEquality().equals(other.featuredStaff, featuredStaff)&&const DeepCollectionEquality().equals(other.featuredConsultations, featuredConsultations)&&const DeepCollectionEquality().equals(other.featuredArticles, featuredArticles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(featuredServices),const DeepCollectionEquality().hash(featuredStaff),const DeepCollectionEquality().hash(featuredConsultations),const DeepCollectionEquality().hash(featuredArticles));

@override
String toString() {
  return 'LandingResponse(featuredServices: $featuredServices, featuredStaff: $featuredStaff, featuredConsultations: $featuredConsultations, featuredArticles: $featuredArticles)';
}


}

/// @nodoc
abstract mixin class $LandingResponseCopyWith<$Res>  {
  factory $LandingResponseCopyWith(LandingResponse value, $Res Function(LandingResponse) _then) = _$LandingResponseCopyWithImpl;
@useResult
$Res call({
 List<ServiceCategory> featuredServices, List<Staff> featuredStaff, List<Consultation> featuredConsultations, List<Article> featuredArticles
});




}
/// @nodoc
class _$LandingResponseCopyWithImpl<$Res>
    implements $LandingResponseCopyWith<$Res> {
  _$LandingResponseCopyWithImpl(this._self, this._then);

  final LandingResponse _self;
  final $Res Function(LandingResponse) _then;

/// Create a copy of LandingResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? featuredServices = null,Object? featuredStaff = null,Object? featuredConsultations = null,Object? featuredArticles = null,}) {
  return _then(_self.copyWith(
featuredServices: null == featuredServices ? _self.featuredServices : featuredServices // ignore: cast_nullable_to_non_nullable
as List<ServiceCategory>,featuredStaff: null == featuredStaff ? _self.featuredStaff : featuredStaff // ignore: cast_nullable_to_non_nullable
as List<Staff>,featuredConsultations: null == featuredConsultations ? _self.featuredConsultations : featuredConsultations // ignore: cast_nullable_to_non_nullable
as List<Consultation>,featuredArticles: null == featuredArticles ? _self.featuredArticles : featuredArticles // ignore: cast_nullable_to_non_nullable
as List<Article>,
  ));
}

}


/// Adds pattern-matching-related methods to [LandingResponse].
extension LandingResponsePatterns on LandingResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LandingResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LandingResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LandingResponse value)  $default,){
final _that = this;
switch (_that) {
case _LandingResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LandingResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LandingResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ServiceCategory> featuredServices,  List<Staff> featuredStaff,  List<Consultation> featuredConsultations,  List<Article> featuredArticles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LandingResponse() when $default != null:
return $default(_that.featuredServices,_that.featuredStaff,_that.featuredConsultations,_that.featuredArticles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ServiceCategory> featuredServices,  List<Staff> featuredStaff,  List<Consultation> featuredConsultations,  List<Article> featuredArticles)  $default,) {final _that = this;
switch (_that) {
case _LandingResponse():
return $default(_that.featuredServices,_that.featuredStaff,_that.featuredConsultations,_that.featuredArticles);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ServiceCategory> featuredServices,  List<Staff> featuredStaff,  List<Consultation> featuredConsultations,  List<Article> featuredArticles)?  $default,) {final _that = this;
switch (_that) {
case _LandingResponse() when $default != null:
return $default(_that.featuredServices,_that.featuredStaff,_that.featuredConsultations,_that.featuredArticles);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LandingResponse implements LandingResponse {
  const _LandingResponse({required final  List<ServiceCategory> featuredServices, required final  List<Staff> featuredStaff, required final  List<Consultation> featuredConsultations, required final  List<Article> featuredArticles}): _featuredServices = featuredServices,_featuredStaff = featuredStaff,_featuredConsultations = featuredConsultations,_featuredArticles = featuredArticles;
  factory _LandingResponse.fromJson(Map<String, dynamic> json) => _$LandingResponseFromJson(json);

 final  List<ServiceCategory> _featuredServices;
@override List<ServiceCategory> get featuredServices {
  if (_featuredServices is EqualUnmodifiableListView) return _featuredServices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_featuredServices);
}

 final  List<Staff> _featuredStaff;
@override List<Staff> get featuredStaff {
  if (_featuredStaff is EqualUnmodifiableListView) return _featuredStaff;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_featuredStaff);
}

 final  List<Consultation> _featuredConsultations;
@override List<Consultation> get featuredConsultations {
  if (_featuredConsultations is EqualUnmodifiableListView) return _featuredConsultations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_featuredConsultations);
}

 final  List<Article> _featuredArticles;
@override List<Article> get featuredArticles {
  if (_featuredArticles is EqualUnmodifiableListView) return _featuredArticles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_featuredArticles);
}


/// Create a copy of LandingResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LandingResponseCopyWith<_LandingResponse> get copyWith => __$LandingResponseCopyWithImpl<_LandingResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LandingResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LandingResponse&&const DeepCollectionEquality().equals(other._featuredServices, _featuredServices)&&const DeepCollectionEquality().equals(other._featuredStaff, _featuredStaff)&&const DeepCollectionEquality().equals(other._featuredConsultations, _featuredConsultations)&&const DeepCollectionEquality().equals(other._featuredArticles, _featuredArticles));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_featuredServices),const DeepCollectionEquality().hash(_featuredStaff),const DeepCollectionEquality().hash(_featuredConsultations),const DeepCollectionEquality().hash(_featuredArticles));

@override
String toString() {
  return 'LandingResponse(featuredServices: $featuredServices, featuredStaff: $featuredStaff, featuredConsultations: $featuredConsultations, featuredArticles: $featuredArticles)';
}


}

/// @nodoc
abstract mixin class _$LandingResponseCopyWith<$Res> implements $LandingResponseCopyWith<$Res> {
  factory _$LandingResponseCopyWith(_LandingResponse value, $Res Function(_LandingResponse) _then) = __$LandingResponseCopyWithImpl;
@override @useResult
$Res call({
 List<ServiceCategory> featuredServices, List<Staff> featuredStaff, List<Consultation> featuredConsultations, List<Article> featuredArticles
});




}
/// @nodoc
class __$LandingResponseCopyWithImpl<$Res>
    implements _$LandingResponseCopyWith<$Res> {
  __$LandingResponseCopyWithImpl(this._self, this._then);

  final _LandingResponse _self;
  final $Res Function(_LandingResponse) _then;

/// Create a copy of LandingResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? featuredServices = null,Object? featuredStaff = null,Object? featuredConsultations = null,Object? featuredArticles = null,}) {
  return _then(_LandingResponse(
featuredServices: null == featuredServices ? _self._featuredServices : featuredServices // ignore: cast_nullable_to_non_nullable
as List<ServiceCategory>,featuredStaff: null == featuredStaff ? _self._featuredStaff : featuredStaff // ignore: cast_nullable_to_non_nullable
as List<Staff>,featuredConsultations: null == featuredConsultations ? _self._featuredConsultations : featuredConsultations // ignore: cast_nullable_to_non_nullable
as List<Consultation>,featuredArticles: null == featuredArticles ? _self._featuredArticles : featuredArticles // ignore: cast_nullable_to_non_nullable
as List<Article>,
  ));
}


}

// dart format on
