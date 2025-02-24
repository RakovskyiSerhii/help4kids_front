// File: lib/repositories/course_repository.dart
import 'package:help4kids_front/core/either.dart';
import 'package:help4kids_front/core/failure/failure.dart';
import 'package:help4kids_front/data/model/course.dart';
import 'package:help4kids_front/data/network/api.dart';
import 'package:injectable/injectable.dart';
import 'base_repository.dart';

@lazySingleton
class CourseRepository extends BaseRepository {
  final ApiClient _apiClient;
  CourseRepository(this._apiClient);

  Future<Either<Failure, List<Course>>> getAllCourses() async {
    return invokeRequest(() => _apiClient.getAllCourses());
  }

  Future<Either<Failure, List<Course>>> getPurchasedCourses() async {
    return invokeRequest(() => _apiClient.getPurchasedCourses());
  }
}