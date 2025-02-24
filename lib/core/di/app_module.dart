import 'package:dio/dio.dart';
import 'package:help4kids_front/core/value_carrier.dart';
import 'package:help4kids_front/data/network/api.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  ApiClient get apiClient => ApiClient(dio);

  AuthorizationStateCarrier authorizationStateCarrier() => ValueCarrier(false);
}
