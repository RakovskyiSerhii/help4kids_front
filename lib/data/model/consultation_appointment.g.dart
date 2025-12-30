// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consultation_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ConsultationAppointment _$ConsultationAppointmentFromJson(
  Map<String, dynamic> json,
) => _ConsultationAppointment(
  id: json['id'] as String,
  consultationId: json['consultationId'] as String,
  appointmentDatetime: DateTime.parse(json['appointmentDatetime'] as String),
  details: json['details'] as String?,
  orderId: json['orderId'] as String,
);

Map<String, dynamic> _$ConsultationAppointmentToJson(
  _ConsultationAppointment instance,
) => <String, dynamic>{
  'id': instance.id,
  'consultationId': instance.consultationId,
  'appointmentDatetime': instance.appointmentDatetime.toIso8601String(),
  'details': instance.details,
  'orderId': instance.orderId,
};
