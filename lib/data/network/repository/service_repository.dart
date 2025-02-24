// File: lib/repositories/service_repository.dart
import 'package:help4kids_front/core/either.dart';
import 'package:help4kids_front/core/failure/failure.dart';
import 'package:help4kids_front/data/model/service.dart';
import 'package:help4kids_front/data/network/api.dart';
import 'package:injectable/injectable.dart';
import 'base_repository.dart';

@lazySingleton
class ServiceRepository extends BaseRepository {
  final ApiClient _apiClient;
  ServiceRepository(this._apiClient);

  Future<Either<Failure, List<Service>>> getAllServices() async {
    return invokeRequest(() => _apiClient.getAllServices());
  }

  Future<Either<Failure, Service>> getServiceById(String serviceId) async {
    return invokeRequest(() => _apiClient.getServiceById(serviceId));
  }
}