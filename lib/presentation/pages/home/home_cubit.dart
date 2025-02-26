import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help4kids_front/core/result.dart';
import 'package:help4kids_front/data/network/repository/landing_repository.dart';
import 'package:help4kids_front/presentation/pages/home/home_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final LandingRepository _landingRepository;

  HomeCubit(this._landingRepository) : super(HomeState()) {
    load();
  }

  void load() async {
    emit(state.copyWith(loadingResult: Result.progress()));
    _landingRepository.getLanding().then(
      (value) {
        value.either(
          (error) => emit(state.copyWith(
              loadingResult: Result.failure(error))),
          (data) => emit(
              state.copyWith(landing: data, loadingResult: Result.success())),
        );
      },
    );
  }
}
