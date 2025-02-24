// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) connection,
    required TResult Function(String? message, int? code) apiError,
    required TResult Function(String? message) manualError,
    required TResult Function() payment,
    required TResult Function(String message) fatal,
    required TResult Function(String message) removedUser,
    required TResult Function(String message) timeout,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String? message) badRequest,
    required TResult Function(String message) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? connection,
    TResult? Function(String? message, int? code)? apiError,
    TResult? Function(String? message)? manualError,
    TResult? Function()? payment,
    TResult? Function(String message)? fatal,
    TResult? Function(String message)? removedUser,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String message)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? connection,
    TResult Function(String? message, int? code)? apiError,
    TResult Function(String? message)? manualError,
    TResult Function()? payment,
    TResult Function(String message)? fatal,
    TResult Function(String message)? removedUser,
    TResult Function(String message)? timeout,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String? message)? badRequest,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connection value) connection,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_ManualError value) manualError,
    required TResult Function(_Payment value) payment,
    required TResult Function(_Fatal value) fatal,
    required TResult Function(_RemovedUser value) removedUser,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connection value)? connection,
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_ManualError value)? manualError,
    TResult? Function(_Payment value)? payment,
    TResult? Function(_Fatal value)? fatal,
    TResult? Function(_RemovedUser value)? removedUser,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connection value)? connection,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_ManualError value)? manualError,
    TResult Function(_Payment value)? payment,
    TResult Function(_Fatal value)? fatal,
    TResult Function(_RemovedUser value)? removedUser,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ConnectionImplCopyWith<$Res> {
  factory _$$ConnectionImplCopyWith(
          _$ConnectionImpl value, $Res Function(_$ConnectionImpl) then) =
      __$$ConnectionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ConnectionImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ConnectionImpl>
    implements _$$ConnectionImplCopyWith<$Res> {
  __$$ConnectionImplCopyWithImpl(
      _$ConnectionImpl _value, $Res Function(_$ConnectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ConnectionImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ConnectionImpl implements _Connection {
  const _$ConnectionImpl({this.message = "Connection error"});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.connection(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConnectionImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConnectionImplCopyWith<_$ConnectionImpl> get copyWith =>
      __$$ConnectionImplCopyWithImpl<_$ConnectionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) connection,
    required TResult Function(String? message, int? code) apiError,
    required TResult Function(String? message) manualError,
    required TResult Function() payment,
    required TResult Function(String message) fatal,
    required TResult Function(String message) removedUser,
    required TResult Function(String message) timeout,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String? message) badRequest,
    required TResult Function(String message) unknown,
  }) {
    return connection(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? connection,
    TResult? Function(String? message, int? code)? apiError,
    TResult? Function(String? message)? manualError,
    TResult? Function()? payment,
    TResult? Function(String message)? fatal,
    TResult? Function(String message)? removedUser,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String message)? unknown,
  }) {
    return connection?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? connection,
    TResult Function(String? message, int? code)? apiError,
    TResult Function(String? message)? manualError,
    TResult Function()? payment,
    TResult Function(String message)? fatal,
    TResult Function(String message)? removedUser,
    TResult Function(String message)? timeout,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String? message)? badRequest,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (connection != null) {
      return connection(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connection value) connection,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_ManualError value) manualError,
    required TResult Function(_Payment value) payment,
    required TResult Function(_Fatal value) fatal,
    required TResult Function(_RemovedUser value) removedUser,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return connection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connection value)? connection,
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_ManualError value)? manualError,
    TResult? Function(_Payment value)? payment,
    TResult? Function(_Fatal value)? fatal,
    TResult? Function(_RemovedUser value)? removedUser,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return connection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connection value)? connection,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_ManualError value)? manualError,
    TResult Function(_Payment value)? payment,
    TResult Function(_Fatal value)? fatal,
    TResult Function(_RemovedUser value)? removedUser,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (connection != null) {
      return connection(this);
    }
    return orElse();
  }
}

abstract class _Connection implements Failure {
  const factory _Connection({final String message}) = _$ConnectionImpl;

  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConnectionImplCopyWith<_$ConnectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiErrorImplCopyWith<$Res> {
  factory _$$ApiErrorImplCopyWith(
          _$ApiErrorImpl value, $Res Function(_$ApiErrorImpl) then) =
      __$$ApiErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message, int? code});
}

/// @nodoc
class __$$ApiErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ApiErrorImpl>
    implements _$$ApiErrorImplCopyWith<$Res> {
  __$$ApiErrorImplCopyWithImpl(
      _$ApiErrorImpl _value, $Res Function(_$ApiErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_$ApiErrorImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$ApiErrorImpl implements _ApiError {
  const _$ApiErrorImpl({this.message, this.code});

  @override
  final String? message;
  @override
  final int? code;

  @override
  String toString() {
    return 'Failure.apiError(message: $message, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiErrorImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, code);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiErrorImplCopyWith<_$ApiErrorImpl> get copyWith =>
      __$$ApiErrorImplCopyWithImpl<_$ApiErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) connection,
    required TResult Function(String? message, int? code) apiError,
    required TResult Function(String? message) manualError,
    required TResult Function() payment,
    required TResult Function(String message) fatal,
    required TResult Function(String message) removedUser,
    required TResult Function(String message) timeout,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String? message) badRequest,
    required TResult Function(String message) unknown,
  }) {
    return apiError(message, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? connection,
    TResult? Function(String? message, int? code)? apiError,
    TResult? Function(String? message)? manualError,
    TResult? Function()? payment,
    TResult? Function(String message)? fatal,
    TResult? Function(String message)? removedUser,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String message)? unknown,
  }) {
    return apiError?.call(message, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? connection,
    TResult Function(String? message, int? code)? apiError,
    TResult Function(String? message)? manualError,
    TResult Function()? payment,
    TResult Function(String message)? fatal,
    TResult Function(String message)? removedUser,
    TResult Function(String message)? timeout,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String? message)? badRequest,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(message, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connection value) connection,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_ManualError value) manualError,
    required TResult Function(_Payment value) payment,
    required TResult Function(_Fatal value) fatal,
    required TResult Function(_RemovedUser value) removedUser,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return apiError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connection value)? connection,
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_ManualError value)? manualError,
    TResult? Function(_Payment value)? payment,
    TResult? Function(_Fatal value)? fatal,
    TResult? Function(_RemovedUser value)? removedUser,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return apiError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connection value)? connection,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_ManualError value)? manualError,
    TResult Function(_Payment value)? payment,
    TResult Function(_Fatal value)? fatal,
    TResult Function(_RemovedUser value)? removedUser,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (apiError != null) {
      return apiError(this);
    }
    return orElse();
  }
}

abstract class _ApiError implements Failure {
  const factory _ApiError({final String? message, final int? code}) =
      _$ApiErrorImpl;

  String? get message;
  int? get code;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiErrorImplCopyWith<_$ApiErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ManualErrorImplCopyWith<$Res> {
  factory _$$ManualErrorImplCopyWith(
          _$ManualErrorImpl value, $Res Function(_$ManualErrorImpl) then) =
      __$$ManualErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$ManualErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ManualErrorImpl>
    implements _$$ManualErrorImplCopyWith<$Res> {
  __$$ManualErrorImplCopyWithImpl(
      _$ManualErrorImpl _value, $Res Function(_$ManualErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$ManualErrorImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ManualErrorImpl implements _ManualError {
  const _$ManualErrorImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.manualError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ManualErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ManualErrorImplCopyWith<_$ManualErrorImpl> get copyWith =>
      __$$ManualErrorImplCopyWithImpl<_$ManualErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) connection,
    required TResult Function(String? message, int? code) apiError,
    required TResult Function(String? message) manualError,
    required TResult Function() payment,
    required TResult Function(String message) fatal,
    required TResult Function(String message) removedUser,
    required TResult Function(String message) timeout,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String? message) badRequest,
    required TResult Function(String message) unknown,
  }) {
    return manualError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? connection,
    TResult? Function(String? message, int? code)? apiError,
    TResult? Function(String? message)? manualError,
    TResult? Function()? payment,
    TResult? Function(String message)? fatal,
    TResult? Function(String message)? removedUser,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String message)? unknown,
  }) {
    return manualError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? connection,
    TResult Function(String? message, int? code)? apiError,
    TResult Function(String? message)? manualError,
    TResult Function()? payment,
    TResult Function(String message)? fatal,
    TResult Function(String message)? removedUser,
    TResult Function(String message)? timeout,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String? message)? badRequest,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (manualError != null) {
      return manualError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connection value) connection,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_ManualError value) manualError,
    required TResult Function(_Payment value) payment,
    required TResult Function(_Fatal value) fatal,
    required TResult Function(_RemovedUser value) removedUser,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return manualError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connection value)? connection,
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_ManualError value)? manualError,
    TResult? Function(_Payment value)? payment,
    TResult? Function(_Fatal value)? fatal,
    TResult? Function(_RemovedUser value)? removedUser,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return manualError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connection value)? connection,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_ManualError value)? manualError,
    TResult Function(_Payment value)? payment,
    TResult Function(_Fatal value)? fatal,
    TResult Function(_RemovedUser value)? removedUser,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (manualError != null) {
      return manualError(this);
    }
    return orElse();
  }
}

abstract class _ManualError implements Failure {
  const factory _ManualError({final String? message}) = _$ManualErrorImpl;

  String? get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ManualErrorImplCopyWith<_$ManualErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PaymentImplCopyWith<$Res> {
  factory _$$PaymentImplCopyWith(
          _$PaymentImpl value, $Res Function(_$PaymentImpl) then) =
      __$$PaymentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PaymentImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$PaymentImpl>
    implements _$$PaymentImplCopyWith<$Res> {
  __$$PaymentImplCopyWithImpl(
      _$PaymentImpl _value, $Res Function(_$PaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PaymentImpl implements _Payment {
  const _$PaymentImpl();

  @override
  String toString() {
    return 'Failure.payment()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PaymentImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) connection,
    required TResult Function(String? message, int? code) apiError,
    required TResult Function(String? message) manualError,
    required TResult Function() payment,
    required TResult Function(String message) fatal,
    required TResult Function(String message) removedUser,
    required TResult Function(String message) timeout,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String? message) badRequest,
    required TResult Function(String message) unknown,
  }) {
    return payment();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? connection,
    TResult? Function(String? message, int? code)? apiError,
    TResult? Function(String? message)? manualError,
    TResult? Function()? payment,
    TResult? Function(String message)? fatal,
    TResult? Function(String message)? removedUser,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String message)? unknown,
  }) {
    return payment?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? connection,
    TResult Function(String? message, int? code)? apiError,
    TResult Function(String? message)? manualError,
    TResult Function()? payment,
    TResult Function(String message)? fatal,
    TResult Function(String message)? removedUser,
    TResult Function(String message)? timeout,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String? message)? badRequest,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (payment != null) {
      return payment();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connection value) connection,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_ManualError value) manualError,
    required TResult Function(_Payment value) payment,
    required TResult Function(_Fatal value) fatal,
    required TResult Function(_RemovedUser value) removedUser,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return payment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connection value)? connection,
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_ManualError value)? manualError,
    TResult? Function(_Payment value)? payment,
    TResult? Function(_Fatal value)? fatal,
    TResult? Function(_RemovedUser value)? removedUser,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return payment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connection value)? connection,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_ManualError value)? manualError,
    TResult Function(_Payment value)? payment,
    TResult Function(_Fatal value)? fatal,
    TResult Function(_RemovedUser value)? removedUser,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (payment != null) {
      return payment(this);
    }
    return orElse();
  }
}

abstract class _Payment implements Failure {
  const factory _Payment() = _$PaymentImpl;
}

/// @nodoc
abstract class _$$FatalImplCopyWith<$Res> {
  factory _$$FatalImplCopyWith(
          _$FatalImpl value, $Res Function(_$FatalImpl) then) =
      __$$FatalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FatalImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$FatalImpl>
    implements _$$FatalImplCopyWith<$Res> {
  __$$FatalImplCopyWithImpl(
      _$FatalImpl _value, $Res Function(_$FatalImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FatalImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FatalImpl implements _Fatal {
  const _$FatalImpl({this.message = "A fatal error occurred"});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.fatal(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FatalImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FatalImplCopyWith<_$FatalImpl> get copyWith =>
      __$$FatalImplCopyWithImpl<_$FatalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) connection,
    required TResult Function(String? message, int? code) apiError,
    required TResult Function(String? message) manualError,
    required TResult Function() payment,
    required TResult Function(String message) fatal,
    required TResult Function(String message) removedUser,
    required TResult Function(String message) timeout,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String? message) badRequest,
    required TResult Function(String message) unknown,
  }) {
    return fatal(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? connection,
    TResult? Function(String? message, int? code)? apiError,
    TResult? Function(String? message)? manualError,
    TResult? Function()? payment,
    TResult? Function(String message)? fatal,
    TResult? Function(String message)? removedUser,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String message)? unknown,
  }) {
    return fatal?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? connection,
    TResult Function(String? message, int? code)? apiError,
    TResult Function(String? message)? manualError,
    TResult Function()? payment,
    TResult Function(String message)? fatal,
    TResult Function(String message)? removedUser,
    TResult Function(String message)? timeout,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String? message)? badRequest,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (fatal != null) {
      return fatal(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connection value) connection,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_ManualError value) manualError,
    required TResult Function(_Payment value) payment,
    required TResult Function(_Fatal value) fatal,
    required TResult Function(_RemovedUser value) removedUser,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return fatal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connection value)? connection,
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_ManualError value)? manualError,
    TResult? Function(_Payment value)? payment,
    TResult? Function(_Fatal value)? fatal,
    TResult? Function(_RemovedUser value)? removedUser,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return fatal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connection value)? connection,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_ManualError value)? manualError,
    TResult Function(_Payment value)? payment,
    TResult Function(_Fatal value)? fatal,
    TResult Function(_RemovedUser value)? removedUser,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (fatal != null) {
      return fatal(this);
    }
    return orElse();
  }
}

abstract class _Fatal implements Failure {
  const factory _Fatal({final String message}) = _$FatalImpl;

  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FatalImplCopyWith<_$FatalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemovedUserImplCopyWith<$Res> {
  factory _$$RemovedUserImplCopyWith(
          _$RemovedUserImpl value, $Res Function(_$RemovedUserImpl) then) =
      __$$RemovedUserImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RemovedUserImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$RemovedUserImpl>
    implements _$$RemovedUserImplCopyWith<$Res> {
  __$$RemovedUserImplCopyWithImpl(
      _$RemovedUserImpl _value, $Res Function(_$RemovedUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$RemovedUserImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemovedUserImpl implements _RemovedUser {
  const _$RemovedUserImpl({this.message = "User has been removed"});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.removedUser(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemovedUserImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemovedUserImplCopyWith<_$RemovedUserImpl> get copyWith =>
      __$$RemovedUserImplCopyWithImpl<_$RemovedUserImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) connection,
    required TResult Function(String? message, int? code) apiError,
    required TResult Function(String? message) manualError,
    required TResult Function() payment,
    required TResult Function(String message) fatal,
    required TResult Function(String message) removedUser,
    required TResult Function(String message) timeout,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String? message) badRequest,
    required TResult Function(String message) unknown,
  }) {
    return removedUser(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? connection,
    TResult? Function(String? message, int? code)? apiError,
    TResult? Function(String? message)? manualError,
    TResult? Function()? payment,
    TResult? Function(String message)? fatal,
    TResult? Function(String message)? removedUser,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String message)? unknown,
  }) {
    return removedUser?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? connection,
    TResult Function(String? message, int? code)? apiError,
    TResult Function(String? message)? manualError,
    TResult Function()? payment,
    TResult Function(String message)? fatal,
    TResult Function(String message)? removedUser,
    TResult Function(String message)? timeout,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String? message)? badRequest,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (removedUser != null) {
      return removedUser(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connection value) connection,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_ManualError value) manualError,
    required TResult Function(_Payment value) payment,
    required TResult Function(_Fatal value) fatal,
    required TResult Function(_RemovedUser value) removedUser,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return removedUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connection value)? connection,
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_ManualError value)? manualError,
    TResult? Function(_Payment value)? payment,
    TResult? Function(_Fatal value)? fatal,
    TResult? Function(_RemovedUser value)? removedUser,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return removedUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connection value)? connection,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_ManualError value)? manualError,
    TResult Function(_Payment value)? payment,
    TResult Function(_Fatal value)? fatal,
    TResult Function(_RemovedUser value)? removedUser,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (removedUser != null) {
      return removedUser(this);
    }
    return orElse();
  }
}

abstract class _RemovedUser implements Failure {
  const factory _RemovedUser({final String message}) = _$RemovedUserImpl;

  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemovedUserImplCopyWith<_$RemovedUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimeoutImplCopyWith<$Res> {
  factory _$$TimeoutImplCopyWith(
          _$TimeoutImpl value, $Res Function(_$TimeoutImpl) then) =
      __$$TimeoutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TimeoutImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$TimeoutImpl>
    implements _$$TimeoutImplCopyWith<$Res> {
  __$$TimeoutImplCopyWithImpl(
      _$TimeoutImpl _value, $Res Function(_$TimeoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TimeoutImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TimeoutImpl implements _Timeout {
  const _$TimeoutImpl({this.message = "Request timed out"});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.timeout(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeoutImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeoutImplCopyWith<_$TimeoutImpl> get copyWith =>
      __$$TimeoutImplCopyWithImpl<_$TimeoutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) connection,
    required TResult Function(String? message, int? code) apiError,
    required TResult Function(String? message) manualError,
    required TResult Function() payment,
    required TResult Function(String message) fatal,
    required TResult Function(String message) removedUser,
    required TResult Function(String message) timeout,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String? message) badRequest,
    required TResult Function(String message) unknown,
  }) {
    return timeout(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? connection,
    TResult? Function(String? message, int? code)? apiError,
    TResult? Function(String? message)? manualError,
    TResult? Function()? payment,
    TResult? Function(String message)? fatal,
    TResult? Function(String message)? removedUser,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String message)? unknown,
  }) {
    return timeout?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? connection,
    TResult Function(String? message, int? code)? apiError,
    TResult Function(String? message)? manualError,
    TResult Function()? payment,
    TResult Function(String message)? fatal,
    TResult Function(String message)? removedUser,
    TResult Function(String message)? timeout,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String? message)? badRequest,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connection value) connection,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_ManualError value) manualError,
    required TResult Function(_Payment value) payment,
    required TResult Function(_Fatal value) fatal,
    required TResult Function(_RemovedUser value) removedUser,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return timeout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connection value)? connection,
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_ManualError value)? manualError,
    TResult? Function(_Payment value)? payment,
    TResult? Function(_Fatal value)? fatal,
    TResult? Function(_RemovedUser value)? removedUser,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return timeout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connection value)? connection,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_ManualError value)? manualError,
    TResult Function(_Payment value)? payment,
    TResult Function(_Fatal value)? fatal,
    TResult Function(_RemovedUser value)? removedUser,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (timeout != null) {
      return timeout(this);
    }
    return orElse();
  }
}

abstract class _Timeout implements Failure {
  const factory _Timeout({final String message}) = _$TimeoutImpl;

  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeoutImplCopyWith<_$TimeoutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<$Res> {
  factory _$$UnauthorizedImplCopyWith(
          _$UnauthorizedImpl value, $Res Function(_$UnauthorizedImpl) then) =
      __$$UnauthorizedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnauthorizedImpl>
    implements _$$UnauthorizedImplCopyWith<$Res> {
  __$$UnauthorizedImplCopyWithImpl(
      _$UnauthorizedImpl _value, $Res Function(_$UnauthorizedImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnauthorizedImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnauthorizedImpl implements _Unauthorized {
  const _$UnauthorizedImpl({this.message = "Unauthorized"});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.unauthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      __$$UnauthorizedImplCopyWithImpl<_$UnauthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) connection,
    required TResult Function(String? message, int? code) apiError,
    required TResult Function(String? message) manualError,
    required TResult Function() payment,
    required TResult Function(String message) fatal,
    required TResult Function(String message) removedUser,
    required TResult Function(String message) timeout,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String? message) badRequest,
    required TResult Function(String message) unknown,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? connection,
    TResult? Function(String? message, int? code)? apiError,
    TResult? Function(String? message)? manualError,
    TResult? Function()? payment,
    TResult? Function(String message)? fatal,
    TResult? Function(String message)? removedUser,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String message)? unknown,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? connection,
    TResult Function(String? message, int? code)? apiError,
    TResult Function(String? message)? manualError,
    TResult Function()? payment,
    TResult Function(String message)? fatal,
    TResult Function(String message)? removedUser,
    TResult Function(String message)? timeout,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String? message)? badRequest,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connection value) connection,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_ManualError value) manualError,
    required TResult Function(_Payment value) payment,
    required TResult Function(_Fatal value) fatal,
    required TResult Function(_RemovedUser value) removedUser,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connection value)? connection,
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_ManualError value)? manualError,
    TResult? Function(_Payment value)? payment,
    TResult? Function(_Fatal value)? fatal,
    TResult? Function(_RemovedUser value)? removedUser,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connection value)? connection,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_ManualError value)? manualError,
    TResult Function(_Payment value)? payment,
    TResult Function(_Fatal value)? fatal,
    TResult Function(_RemovedUser value)? removedUser,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class _Unauthorized implements Failure {
  const factory _Unauthorized({final String message}) = _$UnauthorizedImpl;

  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
          _$NotFoundImpl value, $Res Function(_$NotFoundImpl) then) =
      __$$NotFoundImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
      _$NotFoundImpl _value, $Res Function(_$NotFoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotFoundImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotFoundImpl implements _NotFound {
  const _$NotFoundImpl({this.message = "Resource not found"});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.notFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      __$$NotFoundImplCopyWithImpl<_$NotFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) connection,
    required TResult Function(String? message, int? code) apiError,
    required TResult Function(String? message) manualError,
    required TResult Function() payment,
    required TResult Function(String message) fatal,
    required TResult Function(String message) removedUser,
    required TResult Function(String message) timeout,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String? message) badRequest,
    required TResult Function(String message) unknown,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? connection,
    TResult? Function(String? message, int? code)? apiError,
    TResult? Function(String? message)? manualError,
    TResult? Function()? payment,
    TResult? Function(String message)? fatal,
    TResult? Function(String message)? removedUser,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String message)? unknown,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? connection,
    TResult Function(String? message, int? code)? apiError,
    TResult Function(String? message)? manualError,
    TResult Function()? payment,
    TResult Function(String message)? fatal,
    TResult Function(String message)? removedUser,
    TResult Function(String message)? timeout,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String? message)? badRequest,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connection value) connection,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_ManualError value) manualError,
    required TResult Function(_Payment value) payment,
    required TResult Function(_Fatal value) fatal,
    required TResult Function(_RemovedUser value) removedUser,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connection value)? connection,
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_ManualError value)? manualError,
    TResult? Function(_Payment value)? payment,
    TResult? Function(_Fatal value)? fatal,
    TResult? Function(_RemovedUser value)? removedUser,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connection value)? connection,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_ManualError value)? manualError,
    TResult Function(_Payment value)? payment,
    TResult Function(_Fatal value)? fatal,
    TResult Function(_RemovedUser value)? removedUser,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class _NotFound implements Failure {
  const factory _NotFound({final String message}) = _$NotFoundImpl;

  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BadRequestImplCopyWith<$Res> {
  factory _$$BadRequestImplCopyWith(
          _$BadRequestImpl value, $Res Function(_$BadRequestImpl) then) =
      __$$BadRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$BadRequestImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$BadRequestImpl>
    implements _$$BadRequestImplCopyWith<$Res> {
  __$$BadRequestImplCopyWithImpl(
      _$BadRequestImpl _value, $Res Function(_$BadRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$BadRequestImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BadRequestImpl implements _BadRequest {
  const _$BadRequestImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.badRequest(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadRequestImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BadRequestImplCopyWith<_$BadRequestImpl> get copyWith =>
      __$$BadRequestImplCopyWithImpl<_$BadRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) connection,
    required TResult Function(String? message, int? code) apiError,
    required TResult Function(String? message) manualError,
    required TResult Function() payment,
    required TResult Function(String message) fatal,
    required TResult Function(String message) removedUser,
    required TResult Function(String message) timeout,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String? message) badRequest,
    required TResult Function(String message) unknown,
  }) {
    return badRequest(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? connection,
    TResult? Function(String? message, int? code)? apiError,
    TResult? Function(String? message)? manualError,
    TResult? Function()? payment,
    TResult? Function(String message)? fatal,
    TResult? Function(String message)? removedUser,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String message)? unknown,
  }) {
    return badRequest?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? connection,
    TResult Function(String? message, int? code)? apiError,
    TResult Function(String? message)? manualError,
    TResult Function()? payment,
    TResult Function(String message)? fatal,
    TResult Function(String message)? removedUser,
    TResult Function(String message)? timeout,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String? message)? badRequest,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connection value) connection,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_ManualError value) manualError,
    required TResult Function(_Payment value) payment,
    required TResult Function(_Fatal value) fatal,
    required TResult Function(_RemovedUser value) removedUser,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return badRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connection value)? connection,
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_ManualError value)? manualError,
    TResult? Function(_Payment value)? payment,
    TResult? Function(_Fatal value)? fatal,
    TResult? Function(_RemovedUser value)? removedUser,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return badRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connection value)? connection,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_ManualError value)? manualError,
    TResult Function(_Payment value)? payment,
    TResult Function(_Fatal value)? fatal,
    TResult Function(_RemovedUser value)? removedUser,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(this);
    }
    return orElse();
  }
}

abstract class _BadRequest implements Failure {
  const factory _BadRequest({final String? message}) = _$BadRequestImpl;

  String? get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BadRequestImplCopyWith<_$BadRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownImplCopyWith<$Res> {
  factory _$$UnknownImplCopyWith(
          _$UnknownImpl value, $Res Function(_$UnknownImpl) then) =
      __$$UnknownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnknownImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnknownImpl>
    implements _$$UnknownImplCopyWith<$Res> {
  __$$UnknownImplCopyWithImpl(
      _$UnknownImpl _value, $Res Function(_$UnknownImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$UnknownImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnknownImpl implements _Unknown {
  const _$UnknownImpl({this.message = "Unknown error"});

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'Failure.unknown(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      __$$UnknownImplCopyWithImpl<_$UnknownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) connection,
    required TResult Function(String? message, int? code) apiError,
    required TResult Function(String? message) manualError,
    required TResult Function() payment,
    required TResult Function(String message) fatal,
    required TResult Function(String message) removedUser,
    required TResult Function(String message) timeout,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String? message) badRequest,
    required TResult Function(String message) unknown,
  }) {
    return unknown(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? connection,
    TResult? Function(String? message, int? code)? apiError,
    TResult? Function(String? message)? manualError,
    TResult? Function()? payment,
    TResult? Function(String message)? fatal,
    TResult? Function(String message)? removedUser,
    TResult? Function(String message)? timeout,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String? message)? badRequest,
    TResult? Function(String message)? unknown,
  }) {
    return unknown?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? connection,
    TResult Function(String? message, int? code)? apiError,
    TResult Function(String? message)? manualError,
    TResult Function()? payment,
    TResult Function(String message)? fatal,
    TResult Function(String message)? removedUser,
    TResult Function(String message)? timeout,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String? message)? badRequest,
    TResult Function(String message)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Connection value) connection,
    required TResult Function(_ApiError value) apiError,
    required TResult Function(_ManualError value) manualError,
    required TResult Function(_Payment value) payment,
    required TResult Function(_Fatal value) fatal,
    required TResult Function(_RemovedUser value) removedUser,
    required TResult Function(_Timeout value) timeout,
    required TResult Function(_Unauthorized value) unauthorized,
    required TResult Function(_NotFound value) notFound,
    required TResult Function(_BadRequest value) badRequest,
    required TResult Function(_Unknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Connection value)? connection,
    TResult? Function(_ApiError value)? apiError,
    TResult? Function(_ManualError value)? manualError,
    TResult? Function(_Payment value)? payment,
    TResult? Function(_Fatal value)? fatal,
    TResult? Function(_RemovedUser value)? removedUser,
    TResult? Function(_Timeout value)? timeout,
    TResult? Function(_Unauthorized value)? unauthorized,
    TResult? Function(_NotFound value)? notFound,
    TResult? Function(_BadRequest value)? badRequest,
    TResult? Function(_Unknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Connection value)? connection,
    TResult Function(_ApiError value)? apiError,
    TResult Function(_ManualError value)? manualError,
    TResult Function(_Payment value)? payment,
    TResult Function(_Fatal value)? fatal,
    TResult Function(_RemovedUser value)? removedUser,
    TResult Function(_Timeout value)? timeout,
    TResult Function(_Unauthorized value)? unauthorized,
    TResult Function(_NotFound value)? notFound,
    TResult Function(_BadRequest value)? badRequest,
    TResult Function(_Unknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class _Unknown implements Failure {
  const factory _Unknown({final String message}) = _$UnknownImpl;

  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownImplCopyWith<_$UnknownImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
