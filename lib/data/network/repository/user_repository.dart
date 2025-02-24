// File: lib/repositories/user_repository.dart
import 'package:help4kids_front/core/either.dart';
import 'package:help4kids_front/core/failure/failure.dart';
import 'package:help4kids_front/data/model/user.dart';
import 'package:help4kids_front/data/network/api.dart';
import 'package:injectable/injectable.dart';
import 'base_repository.dart';

@lazySingleton
class UserRepository extends BaseRepository {
  final ApiClient _apiClient;
  UserRepository(this._apiClient);

  Future<Either<Failure, User>> login(String email, String password) async {
    return invokeRequest(() => _apiClient.login({'email': email, 'password': password}));
  }

  Future<Either<Failure, User>> register(String email, String password, String firstName, String lastName) async {
    return invokeRequest(() => _apiClient.register({
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
    }));
  }

  Future<Either<Failure, User>> getProfile() async {
    return invokeRequest(() => _apiClient.getUserProfile());
  }

  Future<Either<Failure, void>> changePassword(Map<String, dynamic> body) async {
    return invokeRequest(() => _apiClient.changePassword(body));
  }

  Future<Either<Failure, void>> verifyEmail(String token) async {
    return invokeRequest(() => _apiClient.verifyEmail(token));
  }

  Future<Either<Failure, void>> resendEmail(String email) async {
    return invokeRequest(() => _apiClient.resendEmail({'email': email}));
  }
}