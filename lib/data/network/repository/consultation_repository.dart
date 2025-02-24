// File: lib/repositories/consultation_repository.dart
import 'package:help4kids_front/core/either.dart';
import 'package:help4kids_front/core/failure/failure.dart';
import 'package:help4kids_front/data/model/consultation.dart';
import 'package:help4kids_front/data/network/api.dart';
import 'package:injectable/injectable.dart';
import 'base_repository.dart';

@lazySingleton
class ConsultationRepository extends BaseRepository {
  final ApiClient _apiClient;
  ConsultationRepository(this._apiClient);

  Future<Either<Failure, List<Consultation>>> getAllConsultations() async {
    return invokeRequest(() => _apiClient.getAllConsultations());
  }

  Future<Either<Failure, List<Consultation>>> getPurchasedConsultations() async {
    return invokeRequest(() => _apiClient.getPurchasedConsultations());
  }

  Future<Either<Failure, Consultation>> getConsultationById(String consultationId) async {
    return invokeRequest(() => _apiClient.getConsultationById(consultationId));
  }
}