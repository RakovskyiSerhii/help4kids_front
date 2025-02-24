import 'package:dio/dio.dart';
import 'package:help4kids_front/core/either.dart';
import 'package:help4kids_front/core/failure/failure.dart';

typedef NetworkRequest<T> = Future<T> Function();

class BaseRepository {

  Future<Either<Failure, T>> invokeRequest<T>(NetworkRequest<T> request) async {
    try {
      final result = await request();
      return Right(result);
    } on DioException catch (error) {

      // Connection errors (connectionError, connectionTimeout)
      if (error.type == DioExceptionType.connectionError ||
          error.type == DioExceptionType.connectionTimeout) {
        return Left(Failure.connection());
      }

      // Timeout errors (sendTimeout, receiveTimeout)
      if (error.type == DioExceptionType.sendTimeout ||
          error.type == DioExceptionType.receiveTimeout) {
        return Left(Failure.timeout());
      }

      // Unauthorized error (401)
      if (error.response?.statusCode == 401) {
        return Left(Failure.unauthorized());
      }

      // Not Found error (404)
      if (error.response?.statusCode == 404) {
        return Left(Failure.notFound());
      }

      // Bad Request (400)
      if (error.response?.statusCode == 400) {
        String? message;
        try {
          message = error.response?.data['message'];
        } catch (_) {
          message = error.response?.data.toString();
        }
        return Left(Failure.badRequest(message: message));
      }

      // Forbidden (403) - trigger logout
      if (error.response?.statusCode == 403) {
        return Left(Failure.fatal());
      }

      // Server error (500) considered fatal
      if (error.response?.statusCode == 500) {
        return Left(Failure.fatal());
      }

      // Attempt to extract a message for other API errors.
      String? message;
      try {
        message = error.response?.data['message'];
      } catch (_) {
        message = error.response?.data.toString();
      }
      return Left(Failure.apiError(
        code: error.response?.statusCode ?? 0,
        message: message,
      ));
    } catch (error) {
      return Left(Failure.unknown());
    }
  }
}