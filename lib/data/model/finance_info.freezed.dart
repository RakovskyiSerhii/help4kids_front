// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finance_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FinanceInfo {

 String get id; String get tNumber; String get name; String get officialAddress; String get actualAddress;
/// Create a copy of FinanceInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FinanceInfoCopyWith<FinanceInfo> get copyWith => _$FinanceInfoCopyWithImpl<FinanceInfo>(this as FinanceInfo, _$identity);

  /// Serializes this FinanceInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FinanceInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.tNumber, tNumber) || other.tNumber == tNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.officialAddress, officialAddress) || other.officialAddress == officialAddress)&&(identical(other.actualAddress, actualAddress) || other.actualAddress == actualAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tNumber,name,officialAddress,actualAddress);

@override
String toString() {
  return 'FinanceInfo(id: $id, tNumber: $tNumber, name: $name, officialAddress: $officialAddress, actualAddress: $actualAddress)';
}


}

/// @nodoc
abstract mixin class $FinanceInfoCopyWith<$Res>  {
  factory $FinanceInfoCopyWith(FinanceInfo value, $Res Function(FinanceInfo) _then) = _$FinanceInfoCopyWithImpl;
@useResult
$Res call({
 String id, String tNumber, String name, String officialAddress, String actualAddress
});




}
/// @nodoc
class _$FinanceInfoCopyWithImpl<$Res>
    implements $FinanceInfoCopyWith<$Res> {
  _$FinanceInfoCopyWithImpl(this._self, this._then);

  final FinanceInfo _self;
  final $Res Function(FinanceInfo) _then;

/// Create a copy of FinanceInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tNumber = null,Object? name = null,Object? officialAddress = null,Object? actualAddress = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tNumber: null == tNumber ? _self.tNumber : tNumber // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,officialAddress: null == officialAddress ? _self.officialAddress : officialAddress // ignore: cast_nullable_to_non_nullable
as String,actualAddress: null == actualAddress ? _self.actualAddress : actualAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FinanceInfo].
extension FinanceInfoPatterns on FinanceInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FinanceInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FinanceInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FinanceInfo value)  $default,){
final _that = this;
switch (_that) {
case _FinanceInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FinanceInfo value)?  $default,){
final _that = this;
switch (_that) {
case _FinanceInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String tNumber,  String name,  String officialAddress,  String actualAddress)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FinanceInfo() when $default != null:
return $default(_that.id,_that.tNumber,_that.name,_that.officialAddress,_that.actualAddress);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String tNumber,  String name,  String officialAddress,  String actualAddress)  $default,) {final _that = this;
switch (_that) {
case _FinanceInfo():
return $default(_that.id,_that.tNumber,_that.name,_that.officialAddress,_that.actualAddress);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String tNumber,  String name,  String officialAddress,  String actualAddress)?  $default,) {final _that = this;
switch (_that) {
case _FinanceInfo() when $default != null:
return $default(_that.id,_that.tNumber,_that.name,_that.officialAddress,_that.actualAddress);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FinanceInfo implements FinanceInfo {
  const _FinanceInfo({required this.id, required this.tNumber, required this.name, required this.officialAddress, required this.actualAddress});
  factory _FinanceInfo.fromJson(Map<String, dynamic> json) => _$FinanceInfoFromJson(json);

@override final  String id;
@override final  String tNumber;
@override final  String name;
@override final  String officialAddress;
@override final  String actualAddress;

/// Create a copy of FinanceInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FinanceInfoCopyWith<_FinanceInfo> get copyWith => __$FinanceInfoCopyWithImpl<_FinanceInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FinanceInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FinanceInfo&&(identical(other.id, id) || other.id == id)&&(identical(other.tNumber, tNumber) || other.tNumber == tNumber)&&(identical(other.name, name) || other.name == name)&&(identical(other.officialAddress, officialAddress) || other.officialAddress == officialAddress)&&(identical(other.actualAddress, actualAddress) || other.actualAddress == actualAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tNumber,name,officialAddress,actualAddress);

@override
String toString() {
  return 'FinanceInfo(id: $id, tNumber: $tNumber, name: $name, officialAddress: $officialAddress, actualAddress: $actualAddress)';
}


}

/// @nodoc
abstract mixin class _$FinanceInfoCopyWith<$Res> implements $FinanceInfoCopyWith<$Res> {
  factory _$FinanceInfoCopyWith(_FinanceInfo value, $Res Function(_FinanceInfo) _then) = __$FinanceInfoCopyWithImpl;
@override @useResult
$Res call({
 String id, String tNumber, String name, String officialAddress, String actualAddress
});




}
/// @nodoc
class __$FinanceInfoCopyWithImpl<$Res>
    implements _$FinanceInfoCopyWith<$Res> {
  __$FinanceInfoCopyWithImpl(this._self, this._then);

  final _FinanceInfo _self;
  final $Res Function(_FinanceInfo) _then;

/// Create a copy of FinanceInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tNumber = null,Object? name = null,Object? officialAddress = null,Object? actualAddress = null,}) {
  return _then(_FinanceInfo(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,tNumber: null == tNumber ? _self.tNumber : tNumber // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,officialAddress: null == officialAddress ? _self.officialAddress : officialAddress // ignore: cast_nullable_to_non_nullable
as String,actualAddress: null == actualAddress ? _self.actualAddress : actualAddress // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
