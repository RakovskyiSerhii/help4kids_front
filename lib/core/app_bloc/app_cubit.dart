import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help4kids_front/core/app_bloc/app_state.dart';
import 'package:help4kids_front/core/result.dart';
import 'package:help4kids_front/data/network/repository/landing_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AppCubit extends Cubit<AppState> {
  final LandingRepository _landingRepository;

  AppCubit(this._landingRepository) : super(AppState()) {
    load();
  }

  void load() {
    emit(state.copyWith(loadingResult: Result.progress()));
    _landingRepository.getGeneral().then((value) {
      value.either(
        (l) {
          print('general info lolo $l');

          emit(state.copyWith(loadingResult: Result.failure(l)));
        },
        (r) {
          print('general info lolo $r');
          emit(state.copyWith(info: r, loadingResult: Result.success()));
        },
      );
    });
  }
}
