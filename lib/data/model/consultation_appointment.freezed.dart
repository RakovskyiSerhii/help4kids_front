// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consultation_appointment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConsultationAppointment {

 String get id; String get consultationId; DateTime get appointmentDatetime; String? get details; String get orderId;
/// Create a copy of ConsultationAppointment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConsultationAppointmentCopyWith<ConsultationAppointment> get copyWith => _$ConsultationAppointmentCopyWithImpl<ConsultationAppointment>(this as ConsultationAppointment, _$identity);

  /// Serializes this ConsultationAppointment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConsultationAppointment&&(identical(other.id, id) || other.id == id)&&(identical(other.consultationId, consultationId) || other.consultationId == consultationId)&&(identical(other.appointmentDatetime, appointmentDatetime) || other.appointmentDatetime == appointmentDatetime)&&(identical(other.details, details) || other.details == details)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,consultationId,appointmentDatetime,details,orderId);

@override
String toString() {
  return 'ConsultationAppointment(id: $id, consultationId: $consultationId, appointmentDatetime: $appointmentDatetime, details: $details, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class $ConsultationAppointmentCopyWith<$Res>  {
  factory $ConsultationAppointmentCopyWith(ConsultationAppointment value, $Res Function(ConsultationAppointment) _then) = _$ConsultationAppointmentCopyWithImpl;
@useResult
$Res call({
 String id, String consultationId, DateTime appointmentDatetime, String? details, String orderId
});




}
/// @nodoc
class _$ConsultationAppointmentCopyWithImpl<$Res>
    implements $ConsultationAppointmentCopyWith<$Res> {
  _$ConsultationAppointmentCopyWithImpl(this._self, this._then);

  final ConsultationAppointment _self;
  final $Res Function(ConsultationAppointment) _then;

/// Create a copy of ConsultationAppointment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? consultationId = null,Object? appointmentDatetime = null,Object? details = freezed,Object? orderId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,consultationId: null == consultationId ? _self.consultationId : consultationId // ignore: cast_nullable_to_non_nullable
as String,appointmentDatetime: null == appointmentDatetime ? _self.appointmentDatetime : appointmentDatetime // ignore: cast_nullable_to_non_nullable
as DateTime,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ConsultationAppointment].
extension ConsultationAppointmentPatterns on ConsultationAppointment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConsultationAppointment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConsultationAppointment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConsultationAppointment value)  $default,){
final _that = this;
switch (_that) {
case _ConsultationAppointment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConsultationAppointment value)?  $default,){
final _that = this;
switch (_that) {
case _ConsultationAppointment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String consultationId,  DateTime appointmentDatetime,  String? details,  String orderId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConsultationAppointment() when $default != null:
return $default(_that.id,_that.consultationId,_that.appointmentDatetime,_that.details,_that.orderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String consultationId,  DateTime appointmentDatetime,  String? details,  String orderId)  $default,) {final _that = this;
switch (_that) {
case _ConsultationAppointment():
return $default(_that.id,_that.consultationId,_that.appointmentDatetime,_that.details,_that.orderId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String consultationId,  DateTime appointmentDatetime,  String? details,  String orderId)?  $default,) {final _that = this;
switch (_that) {
case _ConsultationAppointment() when $default != null:
return $default(_that.id,_that.consultationId,_that.appointmentDatetime,_that.details,_that.orderId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConsultationAppointment implements ConsultationAppointment {
  const _ConsultationAppointment({required this.id, required this.consultationId, required this.appointmentDatetime, this.details, required this.orderId});
  factory _ConsultationAppointment.fromJson(Map<String, dynamic> json) => _$ConsultationAppointmentFromJson(json);

@override final  String id;
@override final  String consultationId;
@override final  DateTime appointmentDatetime;
@override final  String? details;
@override final  String orderId;

/// Create a copy of ConsultationAppointment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConsultationAppointmentCopyWith<_ConsultationAppointment> get copyWith => __$ConsultationAppointmentCopyWithImpl<_ConsultationAppointment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConsultationAppointmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConsultationAppointment&&(identical(other.id, id) || other.id == id)&&(identical(other.consultationId, consultationId) || other.consultationId == consultationId)&&(identical(other.appointmentDatetime, appointmentDatetime) || other.appointmentDatetime == appointmentDatetime)&&(identical(other.details, details) || other.details == details)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,consultationId,appointmentDatetime,details,orderId);

@override
String toString() {
  return 'ConsultationAppointment(id: $id, consultationId: $consultationId, appointmentDatetime: $appointmentDatetime, details: $details, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$ConsultationAppointmentCopyWith<$Res> implements $ConsultationAppointmentCopyWith<$Res> {
  factory _$ConsultationAppointmentCopyWith(_ConsultationAppointment value, $Res Function(_ConsultationAppointment) _then) = __$ConsultationAppointmentCopyWithImpl;
@override @useResult
$Res call({
 String id, String consultationId, DateTime appointmentDatetime, String? details, String orderId
});




}
/// @nodoc
class __$ConsultationAppointmentCopyWithImpl<$Res>
    implements _$ConsultationAppointmentCopyWith<$Res> {
  __$ConsultationAppointmentCopyWithImpl(this._self, this._then);

  final _ConsultationAppointment _self;
  final $Res Function(_ConsultationAppointment) _then;

/// Create a copy of ConsultationAppointment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? consultationId = null,Object? appointmentDatetime = null,Object? details = freezed,Object? orderId = null,}) {
  return _then(_ConsultationAppointment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,consultationId: null == consultationId ? _self.consultationId : consultationId // ignore: cast_nullable_to_non_nullable
as String,appointmentDatetime: null == appointmentDatetime ? _self.appointmentDatetime : appointmentDatetime // ignore: cast_nullable_to_non_nullable
as DateTime,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
