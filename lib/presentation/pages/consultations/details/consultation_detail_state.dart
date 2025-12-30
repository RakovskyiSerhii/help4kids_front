import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:help4kids_front/core/result.dart';
import 'package:help4kids_front/data/model/consultation.dart';

part 'consultation_detail_state.freezed.dart';

@freezed
sealed class ConsultationDetailState with _$ConsultationDetailState {
  factory ConsultationDetailState({
    Consultation? consultation,
    Result? loadingResult,
  }) = _ConsultationDetailState;
}

