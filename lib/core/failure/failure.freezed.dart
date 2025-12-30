// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Connection value)?  connection,TResult Function( _ApiError value)?  apiError,TResult Function( _ManualError value)?  manualError,TResult Function( _Payment value)?  payment,TResult Function( _Fatal value)?  fatal,TResult Function( _RemovedUser value)?  removedUser,TResult Function( _Timeout value)?  timeout,TResult Function( _Unauthorized value)?  unauthorized,TResult Function( _NotFound value)?  notFound,TResult Function( _BadRequest value)?  badRequest,TResult Function( _Unknown value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Connection() when connection != null:
return connection(_that);case _ApiError() when apiError != null:
return apiError(_that);case _ManualError() when manualError != null:
return manualError(_that);case _Payment() when payment != null:
return payment(_that);case _Fatal() when fatal != null:
return fatal(_that);case _RemovedUser() when removedUser != null:
return removedUser(_that);case _Timeout() when timeout != null:
return timeout(_that);case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _NotFound() when notFound != null:
return notFound(_that);case _BadRequest() when badRequest != null:
return badRequest(_that);case _Unknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Connection value)  connection,required TResult Function( _ApiError value)  apiError,required TResult Function( _ManualError value)  manualError,required TResult Function( _Payment value)  payment,required TResult Function( _Fatal value)  fatal,required TResult Function( _RemovedUser value)  removedUser,required TResult Function( _Timeout value)  timeout,required TResult Function( _Unauthorized value)  unauthorized,required TResult Function( _NotFound value)  notFound,required TResult Function( _BadRequest value)  badRequest,required TResult Function( _Unknown value)  unknown,}){
final _that = this;
switch (_that) {
case _Connection():
return connection(_that);case _ApiError():
return apiError(_that);case _ManualError():
return manualError(_that);case _Payment():
return payment(_that);case _Fatal():
return fatal(_that);case _RemovedUser():
return removedUser(_that);case _Timeout():
return timeout(_that);case _Unauthorized():
return unauthorized(_that);case _NotFound():
return notFound(_that);case _BadRequest():
return badRequest(_that);case _Unknown():
return unknown(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Connection value)?  connection,TResult? Function( _ApiError value)?  apiError,TResult? Function( _ManualError value)?  manualError,TResult? Function( _Payment value)?  payment,TResult? Function( _Fatal value)?  fatal,TResult? Function( _RemovedUser value)?  removedUser,TResult? Function( _Timeout value)?  timeout,TResult? Function( _Unauthorized value)?  unauthorized,TResult? Function( _NotFound value)?  notFound,TResult? Function( _BadRequest value)?  badRequest,TResult? Function( _Unknown value)?  unknown,}){
final _that = this;
switch (_that) {
case _Connection() when connection != null:
return connection(_that);case _ApiError() when apiError != null:
return apiError(_that);case _ManualError() when manualError != null:
return manualError(_that);case _Payment() when payment != null:
return payment(_that);case _Fatal() when fatal != null:
return fatal(_that);case _RemovedUser() when removedUser != null:
return removedUser(_that);case _Timeout() when timeout != null:
return timeout(_that);case _Unauthorized() when unauthorized != null:
return unauthorized(_that);case _NotFound() when notFound != null:
return notFound(_that);case _BadRequest() when badRequest != null:
return badRequest(_that);case _Unknown() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String message)?  connection,TResult Function( String? message,  int? code)?  apiError,TResult Function( String? message)?  manualError,TResult Function()?  payment,TResult Function( String message)?  fatal,TResult Function( String message)?  removedUser,TResult Function( String message)?  timeout,TResult Function( String message)?  unauthorized,TResult Function( String message)?  notFound,TResult Function( String? message)?  badRequest,TResult Function( String message)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Connection() when connection != null:
return connection(_that.message);case _ApiError() when apiError != null:
return apiError(_that.message,_that.code);case _ManualError() when manualError != null:
return manualError(_that.message);case _Payment() when payment != null:
return payment();case _Fatal() when fatal != null:
return fatal(_that.message);case _RemovedUser() when removedUser != null:
return removedUser(_that.message);case _Timeout() when timeout != null:
return timeout(_that.message);case _Unauthorized() when unauthorized != null:
return unauthorized(_that.message);case _NotFound() when notFound != null:
return notFound(_that.message);case _BadRequest() when badRequest != null:
return badRequest(_that.message);case _Unknown() when unknown != null:
return unknown(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String message)  connection,required TResult Function( String? message,  int? code)  apiError,required TResult Function( String? message)  manualError,required TResult Function()  payment,required TResult Function( String message)  fatal,required TResult Function( String message)  removedUser,required TResult Function( String message)  timeout,required TResult Function( String message)  unauthorized,required TResult Function( String message)  notFound,required TResult Function( String? message)  badRequest,required TResult Function( String message)  unknown,}) {final _that = this;
switch (_that) {
case _Connection():
return connection(_that.message);case _ApiError():
return apiError(_that.message,_that.code);case _ManualError():
return manualError(_that.message);case _Payment():
return payment();case _Fatal():
return fatal(_that.message);case _RemovedUser():
return removedUser(_that.message);case _Timeout():
return timeout(_that.message);case _Unauthorized():
return unauthorized(_that.message);case _NotFound():
return notFound(_that.message);case _BadRequest():
return badRequest(_that.message);case _Unknown():
return unknown(_that.message);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String message)?  connection,TResult? Function( String? message,  int? code)?  apiError,TResult? Function( String? message)?  manualError,TResult? Function()?  payment,TResult? Function( String message)?  fatal,TResult? Function( String message)?  removedUser,TResult? Function( String message)?  timeout,TResult? Function( String message)?  unauthorized,TResult? Function( String message)?  notFound,TResult? Function( String? message)?  badRequest,TResult? Function( String message)?  unknown,}) {final _that = this;
switch (_that) {
case _Connection() when connection != null:
return connection(_that.message);case _ApiError() when apiError != null:
return apiError(_that.message,_that.code);case _ManualError() when manualError != null:
return manualError(_that.message);case _Payment() when payment != null:
return payment();case _Fatal() when fatal != null:
return fatal(_that.message);case _RemovedUser() when removedUser != null:
return removedUser(_that.message);case _Timeout() when timeout != null:
return timeout(_that.message);case _Unauthorized() when unauthorized != null:
return unauthorized(_that.message);case _NotFound() when notFound != null:
return notFound(_that.message);case _BadRequest() when badRequest != null:
return badRequest(_that.message);case _Unknown() when unknown != null:
return unknown(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Connection implements Failure {
  const _Connection({this.message = "Connection error"});
  

@JsonKey() final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConnectionCopyWith<_Connection> get copyWith => __$ConnectionCopyWithImpl<_Connection>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Connection&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.connection(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ConnectionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$ConnectionCopyWith(_Connection value, $Res Function(_Connection) _then) = __$ConnectionCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ConnectionCopyWithImpl<$Res>
    implements _$ConnectionCopyWith<$Res> {
  __$ConnectionCopyWithImpl(this._self, this._then);

  final _Connection _self;
  final $Res Function(_Connection) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Connection(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _ApiError implements Failure {
  const _ApiError({this.message, this.code});
  

 final  String? message;
 final  int? code;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiErrorCopyWith<_ApiError> get copyWith => __$ApiErrorCopyWithImpl<_ApiError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiError&&(identical(other.message, message) || other.message == message)&&(identical(other.code, code) || other.code == code));
}


@override
int get hashCode => Object.hash(runtimeType,message,code);

@override
String toString() {
  return 'Failure.apiError(message: $message, code: $code)';
}


}

/// @nodoc
abstract mixin class _$ApiErrorCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$ApiErrorCopyWith(_ApiError value, $Res Function(_ApiError) _then) = __$ApiErrorCopyWithImpl;
@useResult
$Res call({
 String? message, int? code
});




}
/// @nodoc
class __$ApiErrorCopyWithImpl<$Res>
    implements _$ApiErrorCopyWith<$Res> {
  __$ApiErrorCopyWithImpl(this._self, this._then);

  final _ApiError _self;
  final $Res Function(_ApiError) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,Object? code = freezed,}) {
  return _then(_ApiError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc


class _ManualError implements Failure {
  const _ManualError({this.message});
  

 final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManualErrorCopyWith<_ManualError> get copyWith => __$ManualErrorCopyWithImpl<_ManualError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManualError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.manualError(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ManualErrorCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$ManualErrorCopyWith(_ManualError value, $Res Function(_ManualError) _then) = __$ManualErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$ManualErrorCopyWithImpl<$Res>
    implements _$ManualErrorCopyWith<$Res> {
  __$ManualErrorCopyWithImpl(this._self, this._then);

  final _ManualError _self;
  final $Res Function(_ManualError) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_ManualError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Payment implements Failure {
  const _Payment();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Payment);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.payment()';
}


}




/// @nodoc


class _Fatal implements Failure {
  const _Fatal({this.message = "A fatal error occurred"});
  

@JsonKey() final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FatalCopyWith<_Fatal> get copyWith => __$FatalCopyWithImpl<_Fatal>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Fatal&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.fatal(message: $message)';
}


}

/// @nodoc
abstract mixin class _$FatalCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$FatalCopyWith(_Fatal value, $Res Function(_Fatal) _then) = __$FatalCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$FatalCopyWithImpl<$Res>
    implements _$FatalCopyWith<$Res> {
  __$FatalCopyWithImpl(this._self, this._then);

  final _Fatal _self;
  final $Res Function(_Fatal) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Fatal(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _RemovedUser implements Failure {
  const _RemovedUser({this.message = "User has been removed"});
  

@JsonKey() final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemovedUserCopyWith<_RemovedUser> get copyWith => __$RemovedUserCopyWithImpl<_RemovedUser>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemovedUser&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.removedUser(message: $message)';
}


}

/// @nodoc
abstract mixin class _$RemovedUserCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$RemovedUserCopyWith(_RemovedUser value, $Res Function(_RemovedUser) _then) = __$RemovedUserCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$RemovedUserCopyWithImpl<$Res>
    implements _$RemovedUserCopyWith<$Res> {
  __$RemovedUserCopyWithImpl(this._self, this._then);

  final _RemovedUser _self;
  final $Res Function(_RemovedUser) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_RemovedUser(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Timeout implements Failure {
  const _Timeout({this.message = "Request timed out"});
  

@JsonKey() final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimeoutCopyWith<_Timeout> get copyWith => __$TimeoutCopyWithImpl<_Timeout>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Timeout&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.timeout(message: $message)';
}


}

/// @nodoc
abstract mixin class _$TimeoutCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$TimeoutCopyWith(_Timeout value, $Res Function(_Timeout) _then) = __$TimeoutCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$TimeoutCopyWithImpl<$Res>
    implements _$TimeoutCopyWith<$Res> {
  __$TimeoutCopyWithImpl(this._self, this._then);

  final _Timeout _self;
  final $Res Function(_Timeout) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Timeout(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Unauthorized implements Failure {
  const _Unauthorized({this.message = "Unauthorized"});
  

@JsonKey() final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnauthorizedCopyWith<_Unauthorized> get copyWith => __$UnauthorizedCopyWithImpl<_Unauthorized>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unauthorized&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.unauthorized(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnauthorizedCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$UnauthorizedCopyWith(_Unauthorized value, $Res Function(_Unauthorized) _then) = __$UnauthorizedCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$UnauthorizedCopyWithImpl<$Res>
    implements _$UnauthorizedCopyWith<$Res> {
  __$UnauthorizedCopyWithImpl(this._self, this._then);

  final _Unauthorized _self;
  final $Res Function(_Unauthorized) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Unauthorized(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _NotFound implements Failure {
  const _NotFound({this.message = "Resource not found"});
  

@JsonKey() final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotFoundCopyWith<_NotFound> get copyWith => __$NotFoundCopyWithImpl<_NotFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFound&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.notFound(message: $message)';
}


}

/// @nodoc
abstract mixin class _$NotFoundCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$NotFoundCopyWith(_NotFound value, $Res Function(_NotFound) _then) = __$NotFoundCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$NotFoundCopyWithImpl<$Res>
    implements _$NotFoundCopyWith<$Res> {
  __$NotFoundCopyWithImpl(this._self, this._then);

  final _NotFound _self;
  final $Res Function(_NotFound) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_NotFound(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BadRequest implements Failure {
  const _BadRequest({this.message});
  

 final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BadRequestCopyWith<_BadRequest> get copyWith => __$BadRequestCopyWithImpl<_BadRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BadRequest&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.badRequest(message: $message)';
}


}

/// @nodoc
abstract mixin class _$BadRequestCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$BadRequestCopyWith(_BadRequest value, $Res Function(_BadRequest) _then) = __$BadRequestCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class __$BadRequestCopyWithImpl<$Res>
    implements _$BadRequestCopyWith<$Res> {
  __$BadRequestCopyWithImpl(this._self, this._then);

  final _BadRequest _self;
  final $Res Function(_BadRequest) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_BadRequest(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class _Unknown implements Failure {
  const _Unknown({this.message = "Unknown error"});
  

@JsonKey() final  String message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnknownCopyWith<_Unknown> get copyWith => __$UnknownCopyWithImpl<_Unknown>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Unknown&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.unknown(message: $message)';
}


}

/// @nodoc
abstract mixin class _$UnknownCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$UnknownCopyWith(_Unknown value, $Res Function(_Unknown) _then) = __$UnknownCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$UnknownCopyWithImpl<$Res>
    implements _$UnknownCopyWith<$Res> {
  __$UnknownCopyWithImpl(this._self, this._then);

  final _Unknown _self;
  final $Res Function(_Unknown) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Unknown(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
