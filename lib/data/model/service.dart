import 'package:freezed_annotation/freezed_annotation.dart';
part 'service.freezed.dart';
part 'service.g.dart';

@freezed
sealed class Service with _$Service {
  const factory Service({
    required String id,
    required String categoryId,
    required String title,
    required String shortDescription,
    String? longDescription,
    String? image,
    required String icon,
    // JSON field stored as Map for flexibility
    required Map<String, dynamic> price,
    int? duration,
    @Default(false) bool featured,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? createdBy,
    String? updatedBy,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);
}