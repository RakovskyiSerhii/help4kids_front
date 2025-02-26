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

  Future<Either<FailureException, User>> login(String email, String password) async {
    return invokeRequest(() => _apiClient.login({'email': email, 'password': password}));
  }

  Future<Either<FailureException, User>> register(String email, String password, String firstName, String lastName) async {
    return invokeRequest(() => _apiClient.register({
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
    }));
  }

  Future<Either<FailureException, User>> getProfile() async {
    return invokeRequest(() => _apiClient.getUserProfile());
  }

  Future<Either<FailureException, void>> changePassword(Map<String, dynamic> body) async {
    return invokeRequest(() => _apiClient.changePassword(body));
  }

  Future<Either<FailureException, void>> verifyEmail(String token) async {
    return invokeRequest(() => _apiClient.verifyEmail(token));
  }

  Future<Either<FailureException, void>> resendEmail(String email) async {
    return invokeRequest(() => _apiClient.resendEmail({'email': email}));
  }
}