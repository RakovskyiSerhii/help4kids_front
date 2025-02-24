// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:help4kids_front/core/auth_state_handler/bloc/auth_state_handler_bloc.dart'
    as _i104;
import 'package:help4kids_front/core/di/app_module.dart' as _i313;
import 'package:help4kids_front/core/value_carrier.dart' as _i281;
import 'package:help4kids_front/data/network/api.dart' as _i65;
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
    return this;
  }
}

class _$AppModule extends _i313.AppModule {}
