// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeneralInfo {

 List<Unit> get units; List<SocialContact> get socialContacts; List<FinanceInfo> get financeInfo; List<Consultation> get consultations; List<ServiceCategory> get categories;
/// Create a copy of GeneralInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneralInfoCopyWith<GeneralInfo> get copyWith => _$GeneralInfoCopyWithImpl<GeneralInfo>(this as GeneralInfo, _$identity);

  /// Serializes this GeneralInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneralInfo&&const DeepCollectionEquality().equals(other.units, units)&&const DeepCollectionEquality().equals(other.socialContacts, socialContacts)&&const DeepCollectionEquality().equals(other.financeInfo, financeInfo)&&const DeepCollectionEquality().equals(other.consultations, consultations)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(units),const DeepCollectionEquality().hash(socialContacts),const DeepCollectionEquality().hash(financeInfo),const DeepCollectionEquality().hash(consultations),const DeepCollectionEquality().hash(categories));

@override
String toString() {
  return 'GeneralInfo(units: $units, socialContacts: $socialContacts, financeInfo: $financeInfo, consultations: $consultations, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $GeneralInfoCopyWith<$Res>  {
  factory $GeneralInfoCopyWith(GeneralInfo value, $Res Function(GeneralInfo) _then) = _$GeneralInfoCopyWithImpl;
@useResult
$Res call({
 List<Unit> units, List<SocialContact> socialContacts, List<FinanceInfo> financeInfo, List<Consultation> consultations, List<ServiceCategory> categories
});




}
/// @nodoc
class _$GeneralInfoCopyWithImpl<$Res>
    implements $GeneralInfoCopyWith<$Res> {
  _$GeneralInfoCopyWithImpl(this._self, this._then);

  final GeneralInfo _self;
  final $Res Function(GeneralInfo) _then;

/// Create a copy of GeneralInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? units = null,Object? socialContacts = null,Object? financeInfo = null,Object? consultations = null,Object? categories = null,}) {
  return _then(_self.copyWith(
units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as List<Unit>,socialContacts: null == socialContacts ? _self.socialContacts : socialContacts // ignore: cast_nullable_to_non_nullable
as List<SocialContact>,financeInfo: null == financeInfo ? _self.financeInfo : financeInfo // ignore: cast_nullable_to_non_nullable
as List<FinanceInfo>,consultations: null == consultations ? _self.consultations : consultations // ignore: cast_nullable_to_non_nullable
as List<Consultation>,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategory>,
  ));
}

}


/// Adds pattern-matching-related methods to [GeneralInfo].
extension GeneralInfoPatterns on GeneralInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeneralInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeneralInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeneralInfo value)  $default,){
final _that = this;
switch (_that) {
case _GeneralInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeneralInfo value)?  $default,){
final _that = this;
switch (_that) {
case _GeneralInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Unit> units,  List<SocialContact> socialContacts,  List<FinanceInfo> financeInfo,  List<Consultation> consultations,  List<ServiceCategory> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeneralInfo() when $default != null:
return $default(_that.units,_that.socialContacts,_that.financeInfo,_that.consultations,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Unit> units,  List<SocialContact> socialContacts,  List<FinanceInfo> financeInfo,  List<Consultation> consultations,  List<ServiceCategory> categories)  $default,) {final _that = this;
switch (_that) {
case _GeneralInfo():
return $default(_that.units,_that.socialContacts,_that.financeInfo,_that.consultations,_that.categories);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Unit> units,  List<SocialContact> socialContacts,  List<FinanceInfo> financeInfo,  List<Consultation> consultations,  List<ServiceCategory> categories)?  $default,) {final _that = this;
switch (_that) {
case _GeneralInfo() when $default != null:
return $default(_that.units,_that.socialContacts,_that.financeInfo,_that.consultations,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeneralInfo implements GeneralInfo {
  const _GeneralInfo({required final  List<Unit> units, required final  List<SocialContact> socialContacts, required final  List<FinanceInfo> financeInfo, required final  List<Consultation> consultations, required final  List<ServiceCategory> categories}): _units = units,_socialContacts = socialContacts,_financeInfo = financeInfo,_consultations = consultations,_categories = categories;
  factory _GeneralInfo.fromJson(Map<String, dynamic> json) => _$GeneralInfoFromJson(json);

 final  List<Unit> _units;
@override List<Unit> get units {
  if (_units is EqualUnmodifiableListView) return _units;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_units);
}

 final  List<SocialContact> _socialContacts;
@override List<SocialContact> get socialContacts {
  if (_socialContacts is EqualUnmodifiableListView) return _socialContacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_socialContacts);
}

 final  List<FinanceInfo> _financeInfo;
@override List<FinanceInfo> get financeInfo {
  if (_financeInfo is EqualUnmodifiableListView) return _financeInfo;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_financeInfo);
}

 final  List<Consultation> _consultations;
@override List<Consultation> get consultations {
  if (_consultations is EqualUnmodifiableListView) return _consultations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_consultations);
}

 final  List<ServiceCategory> _categories;
@override List<ServiceCategory> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of GeneralInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeneralInfoCopyWith<_GeneralInfo> get copyWith => __$GeneralInfoCopyWithImpl<_GeneralInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeneralInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeneralInfo&&const DeepCollectionEquality().equals(other._units, _units)&&const DeepCollectionEquality().equals(other._socialContacts, _socialContacts)&&const DeepCollectionEquality().equals(other._financeInfo, _financeInfo)&&const DeepCollectionEquality().equals(other._consultations, _consultations)&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_units),const DeepCollectionEquality().hash(_socialContacts),const DeepCollectionEquality().hash(_financeInfo),const DeepCollectionEquality().hash(_consultations),const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'GeneralInfo(units: $units, socialContacts: $socialContacts, financeInfo: $financeInfo, consultations: $consultations, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$GeneralInfoCopyWith<$Res> implements $GeneralInfoCopyWith<$Res> {
  factory _$GeneralInfoCopyWith(_GeneralInfo value, $Res Function(_GeneralInfo) _then) = __$GeneralInfoCopyWithImpl;
@override @useResult
$Res call({
 List<Unit> units, List<SocialContact> socialContacts, List<FinanceInfo> financeInfo, List<Consultation> consultations, List<ServiceCategory> categories
});




}
/// @nodoc
class __$GeneralInfoCopyWithImpl<$Res>
    implements _$GeneralInfoCopyWith<$Res> {
  __$GeneralInfoCopyWithImpl(this._self, this._then);

  final _GeneralInfo _self;
  final $Res Function(_GeneralInfo) _then;

/// Create a copy of GeneralInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? units = null,Object? socialContacts = null,Object? financeInfo = null,Object? consultations = null,Object? categories = null,}) {
  return _then(_GeneralInfo(
units: null == units ? _self._units : units // ignore: cast_nullable_to_non_nullable
as List<Unit>,socialContacts: null == socialContacts ? _self._socialContacts : socialContacts // ignore: cast_nullable_to_non_nullable
as List<SocialContact>,financeInfo: null == financeInfo ? _self._financeInfo : financeInfo // ignore: cast_nullable_to_non_nullable
as List<FinanceInfo>,consultations: null == consultations ? _self._consultations : consultations // ignore: cast_nullable_to_non_nullable
as List<Consultation>,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<ServiceCategory>,
  ));
}


}

// dart format on
