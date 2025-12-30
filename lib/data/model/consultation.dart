import 'package:freezed_annotation/freezed_annotation.dart';
part 'consultation.freezed.dart';
part 'consultation.g.dart';

@freezed
sealed class Consultation with _$Consultation {
  const factory Consultation({
    required String id,
    required String title,
    String? shortDescription,
    String? description,
    required double price,
    String? duration,
    Map<String, dynamic>? question,
    @Default(false) bool featured,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? createdBy,
    String? updatedBy,
  }) = _Consultation;

  factory Consultation.fromJson(Map<String, dynamic> json) =>
      _$ConsultationFromJson(json);
}