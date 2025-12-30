import 'package:freezed_annotation/freezed_annotation.dart';
part 'unit.freezed.dart';
part 'unit.g.dart';

@freezed
sealed class Unit with _$Unit {
  const factory Unit({
    required String id,
    required String address,
    required Map<String, String?> workingTime, // JSON string containing workdays, Saturday, Sunday
    required String contactPhone,
    String? socialUrl,
     String? email,
  }) = _Unit;

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

}