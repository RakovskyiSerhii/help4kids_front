// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:help4kids_front/core/app_bloc/app_cubit.dart' as _i408;
import 'package:help4kids_front/core/auth_state_handler/bloc/auth_state_handler_bloc.dart'
    as _i104;
import 'package:help4kids_front/core/di/app_module.dart' as _i313;
import 'package:help4kids_front/core/value_carrier.dart' as _i281;
import 'package:help4kids_front/data/network/api.dart' as _i65;
import 'package:help4kids_front/data/network/repository/article_repository.dart'
    as _i615;
import 'package:help4kids_front/data/network/repository/consultation_appointment_repository.dart'
    as _i891;
import 'package:help4kids_front/data/network/repository/consultation_repository.dart'
    as _i184;
import 'package:help4kids_front/data/network/repository/course_repository.dart'
    as _i251;
import 'package:help4kids_front/data/network/repository/landing_repository.dart'
    as _i891;
import 'package:help4kids_front/data/network/repository/order_repository.dart'
    as _i961;
import 'package:help4kids_front/data/network/repository/service_repository.dart'
    as _i494;
import 'package:help4kids_front/data/network/repository/user_repository.dart'
    as _i617;
import 'package:help4kids_front/presentation/pages/home/home_cubit.dart'
    as _i1048;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.factory<_i281.AuthorizationStateCarrier>(
        () => appModule.authorizationStateCarrier());
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i65.ApiClient>(() => appModule.apiClient);
    gh.factory<_i104.AuthStateHandlerBloc>(() =>
        _i104.AuthStateHandlerBloc(gh<_i281.AuthorizationStateCarrier>()));
    gh.lazySingleton<_i184.ConsultationRepository>(
        () => _i184.ConsultationRepository(gh<_i65.ApiClient>()));
    gh.lazySingleton<_i494.ServiceRepository>(
        () => _i494.ServiceRepository(gh<_i65.ApiClient>()));
    gh.lazySingleton<_i891.LandingRepository>(
        () => _i891.LandingRepository(gh<_i65.ApiClient>()));
    gh.lazySingleton<_i961.OrderRepository>(
        () => _i961.OrderRepository(gh<_i65.ApiClient>()));
    gh.lazySingleton<_i615.ArticleRepository>(
        () => _i615.ArticleRepository(gh<_i65.ApiClient>()));
    gh.lazySingleton<_i891.ConsultationAppointmentRepository>(
        () => _i891.ConsultationAppointmentRepository(gh<_i65.ApiClient>()));
    gh.lazySingleton<_i617.UserRepository>(
        () => _i617.UserRepository(gh<_i65.ApiClient>()));
    gh.lazySingleton<_i251.CourseRepository>(
        () => _i251.CourseRepository(gh<_i65.ApiClient>()));
    gh.factory<_i1048.HomeCubit>(
        () => _i1048.HomeCubit(gh<_i891.LandingRepository>()));
    gh.singleton<_i408.AppCubit>(
        () => _i408.AppCubit(gh<_i891.LandingRepository>()));
    return this;
  }
}

class _$AppModule extends _i313.AppModule {}
