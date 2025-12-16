import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:help4kids_front/core/app_bloc/app_cubit.dart';
import 'package:help4kids_front/core/result.dart';
import 'package:help4kids_front/data/network/repository/service_repository.dart';
import 'package:help4kids_front/presentation/pages/services/services_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ServicesCubit extends Cubit<ServicesState> {
  final ServiceRepository _serviceRepository;

  ServicesCubit(
    this._serviceRepository,
    AppCubit cubit,
  ) : super(ServicesState(
          categories: cubit.state.info?.categories,
        ));

  void load() {
    emit(state.copyWith(loadResult: Result.progress()));
    _serviceRepository.getAllServices().then((services) {
      services.either(
        (error) => emit(state.copyWith(loadResult: Result.failure(error))),
        (services) => emit(state.copyWith(
          services: services,
          loadResult: Result.success(),
        )),
      );
    });
  }
}
