import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help4kids_front/core/result.dart';
import 'package:help4kids_front/data/model/course.dart';
import 'package:help4kids_front/data/network/repository/course_repository.dart';
import 'package:help4kids_front/presentation/pages/admin/admin_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AdminCubit extends Cubit<AdminState> {
  final CourseRepository _courseRepository;

  AdminCubit(this._courseRepository) : super(AdminState()) {
    loadCourses();
  }

  void loadCourses() {
    emit(state.copyWith(loadResult: Result.progress()));
    _courseRepository.getAllCourses().then((value) {
      value.either(
        (error) => emit(state.copyWith(
          loadResult: Result.failure(error),
        )),
        (courses) => emit(state.copyWith(
          courses: courses,
          loadResult: Result.success(),
        )),
      );
    });
  }

  Future<void> createCourse(Map<String, dynamic> courseData) async {
    emit(state.copyWith(createResult: Result.progress()));
    _courseRepository.createCourse(courseData).then((value) {
      value.either(
        (error) => emit(state.copyWith(
          createResult: Result.failure(error),
        )),
        (course) {
          emit(state.copyWith(createResult: Result.success()));
          loadCourses(); // Reload courses after creation
        },
      );
    });
  }

  Future<void> updateCourse(String courseId, Map<String, dynamic> courseData) async {
    emit(state.copyWith(updateResult: Result.progress()));
    _courseRepository.updateCourse(courseId, courseData).then((value) {
      value.either(
        (error) => emit(state.copyWith(
          updateResult: Result.failure(error),
        )),
        (course) {
          emit(state.copyWith(updateResult: Result.success()));
          loadCourses(); // Reload courses after update
        },
      );
    });
  }

  Future<void> deleteCourse(String courseId) async {
    emit(state.copyWith(deleteResult: Result.progress()));
    _courseRepository.deleteCourse(courseId).then((value) {
      value.either(
        (error) => emit(state.copyWith(
          deleteResult: Result.failure(error),
        )),
        (_) {
          emit(state.copyWith(deleteResult: Result.success()));
          loadCourses(); // Reload courses after deletion
        },
      );
    });
  }
}

