import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  /// Connection-related failures (e.g., no internet, timeout).
  const factory Failure.connection({@Default("Connection error") String message}) = _Connection;

  /// API error failures. Contains an optional error message and code.
  const factory Failure.apiError({String? message, int? code}) = _ApiError;

  /// Manual error: used when you want to throw a specific error with a custom message.
  const factory Failure.manualError({String? message}) = _ManualError;

  /// Payment failure: uses PaymentFailureDialogArguments to encapsulate details.
  const factory Failure.payment() = _Payment;

  /// Fatal failures that indicate an unrecoverable error.
  const factory Failure.fatal({@Default("A fatal error occurred") String message}) = _Fatal;

  /// Indicates that a user has been removed.
  const factory Failure.removedUser({@Default("User has been removed") String message}) = _RemovedUser;

  /// Timeout failure.
  const factory Failure.timeout({@Default("Request timed out") String message}) = _Timeout;

  /// Unauthorized failure (e.g., 401).
  const factory Failure.unauthorized({@Default("Unauthorized") String message}) = _Unauthorized;

  /// Not found failure (e.g., 404).
  const factory Failure.notFound({@Default("Resource not found") String message}) = _NotFound;

  /// Bad request failure (e.g., 400).
  const factory Failure.badRequest({String? message}) = _BadRequest;

  /// Unknown error failure.
  const factory Failure.unknown({@Default("Unknown error") String message}) = _Unknown;
}

/// A custom exception that wraps a Failure.
class FailureException implements Exception {
  final Failure failure;
  FailureException(this.failure);
  @override
  String toString() => 'FailureException: $failure';
}