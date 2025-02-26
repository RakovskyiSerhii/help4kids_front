import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:help4kids_front/data/model/service_category.dart';

import 'article.dart';
import 'consultation.dart';
import 'staff.dart';

part 'landing.freezed.dart';
part 'landing.g.dart';

@freezed
class LandingResponse with _$LandingResponse {
  const factory LandingResponse({
    required List<ServiceCategory> featuredServices,
    required List<Staff> featuredStaff,
    required List<Consultation> featuredConsultations,
    required List<Article> featuredArticles,
  }) = _LandingResponse;

  factory LandingResponse.fromJson(Map<String, dynamic> json) =>
      _$LandingResponseFromJson(json);
}