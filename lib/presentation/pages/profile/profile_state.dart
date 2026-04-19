import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:help4kids_front/core/result.dart';
import 'package:help4kids_front/data/model/user.dart';

part 'profile_state.freezed.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  factory ProfileState({
    User? user,
    Result? loadResult,
  }) = _ProfileState;
}

