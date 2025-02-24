import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
abstract class Result<T> with _$Result<T> {
  const Result._();
  const factory Result.success([T? data]) = Success<T>;
  const factory Result.failure(Exception exception) = FailureResult<T>;
  const factory Result.progress() = Progress<T>;

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is FailureResult<T>;
  bool get isProgress => this is Progress<T>;
  T? get value => isSuccess ? (this as Success<T>).data : null;
}
