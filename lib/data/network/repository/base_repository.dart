import 'package:dio/dio.dart';
import 'package:help4kids_front/core/either.dart';
import 'package:help4kids_front/core/failure/failure.dart';

typedef NetworkRequest<T> = Future<T> Function();

class BaseRepository {

  Future<Either<FailureException, T>> invokeRequest<T>(NetworkRequest<T> request) async {
    try {
      final result = await request();
      return Right(result);
    } on DioException catch (error) {

      // Connection errors (connectionError, connectionTimeout)
      if (error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.connectionTimeout) {
        return Left(FailureException(Failure.connection()));
      }

      // Timeout errors (sendTimeout, receiveTimeout)
      if (error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        return Left(FailureException(Failure.timeout()));
      }

      // Unauthorized error (401)
      if (error.response?.statusCode == 401) {
        return Left(FailureException(Failure.unauthorized()));
      }

      // Not Found error (404)
      if (error.response?.statusCode == 404) {
        return Left(FailureException(Failure.notFound()));
      }

      // Bad Request (400)
      if (error.response?.statusCode == 400) {
        String? message;
        try {
          message = error.response?.data['message'];
        } catch (_) {
          message = error.response?.data.toString();
        }
        return Left(FailureException(Failure.badRequest(message: message)));
      }

      // Forbidden (403) - trigger logout
      if (error.response?.statusCode == 403) {
        return Left(FailureException(Failure.fatal()));
      }

      // Server error (500) considered fatal
      if (error.response?.statusCode == 500) {
        return Left(FailureException(Failure.fatal()));
      }

      // Attempt to extract a message for other API errors.
      String? message;
      try {
        message = error.response?.data['message'];
      } catch (_) {
        message = error.response?.data.toString();
      }
      return Left(FailureException(Failure.apiError(
        code: error.response?.statusCode ?? 0,
        message: message,
      )));
    } catch (error) {
      return Left(FailureException(Failure.unknown()));
    }
  }
}