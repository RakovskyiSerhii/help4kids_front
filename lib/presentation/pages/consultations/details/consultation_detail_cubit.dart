import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help4kids_front/core/result.dart';
import 'package:help4kids_front/data/network/repository/consultation_repository.dart';
import 'package:help4kids_front/presentation/pages/consultations/details/consultation_detail_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ConsultationDetailCubit extends Cubit<ConsultationDetailState> {
  final ConsultationRepository _consultationRepository;

  ConsultationDetailCubit(this._consultationRepository)
      : super(ConsultationDetailState());

  void loadConsultation(String consultationId) {
    emit(state.copyWith(loadingResult: Result.progress()));
    _consultationRepository.getConsultationById(consultationId).then((value) {
      value.either(
        (error) => emit(state.copyWith(loadingResult: Result.failure(error))),
        (consultation) => emit(state.copyWith(
          consultation: consultation,
          loadingResult: Result.success(),
        )),
      );
    });
  }
}

