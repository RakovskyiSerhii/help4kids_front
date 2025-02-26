import 'package:dio/dio.dart';
import 'package:help4kids_front/core/value_carrier.dart';
import 'package:help4kids_front/data/network/api.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio();
    // (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
    //     (client) {
    //   return client
    //     ..badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;
    // };
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  }

  @lazySingleton
  ApiClient get apiClient =>
      ApiClient(dio, baseUrl: 'http://localhost:8080/api/');

  AuthorizationStateCarrier authorizationStateCarrier() => ValueCarrier(false);
}
