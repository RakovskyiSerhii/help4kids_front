import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:help4kids_front/core/result.dart';
import 'package:help4kids_front/data/model/general_info.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    GeneralInfo? info,
    Result? loadingResult,
}) =_AppState;

}
