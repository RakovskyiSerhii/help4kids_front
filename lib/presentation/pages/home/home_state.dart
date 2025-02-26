import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:help4kids_front/core/result.dart';
import 'package:help4kids_front/data/model/landing.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  factory HomeState({
    Result? loadingResult,
    LandingResponse? landing,
  }) = _HomeState;
}
