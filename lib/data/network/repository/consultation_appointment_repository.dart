// File: lib/repositories/consultation_appointment_repository.dart
import 'package:help4kids_front/core/either.dart';
import 'package:help4kids_front/core/failure/failure.dart';
import 'package:help4kids_front/data/model/consultation_appointment.dart';
import 'package:help4kids_front/data/network/api.dart';
import 'package:injectable/injectable.dart';
import 'base_repository.dart';

@lazySingleton
class ConsultationAppointmentRepository extends BaseRepository {
  final ApiClient _apiClient;
  ConsultationAppointmentRepository(this._apiClient);

  Future<Either<Failure, List<ConsultationAppointment>>> getAllAppointments() async {
    return invokeRequest(() => _apiClient.getAllAppointments());
  }

  Future<Either<Failure, ConsultationAppointment>> getAppointmentById(String appointmentId) async {
    return invokeRequest(() => _apiClient.getAppointmentById(appointmentId));
  }
}