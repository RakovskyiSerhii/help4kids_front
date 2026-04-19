import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:help4kids_front/core/result.dart';
import 'package:help4kids_front/data/model/course.dart';

part 'admin_state.freezed.dart';

@freezed
sealed class AdminState with _$AdminState {
  factory AdminState({
    List<Course>? courses,
    Result? loadResult,
    Result? createResult,
    Result? updateResult,
    Result? deleteResult,
  }) = _AdminState;
}

