import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:help4kids_front/data/model/consultation.dart';

import 'finance_info.dart';
import 'social_contact.dart';
import 'unit.dart';

part 'general_info.freezed.dart';
part 'general_info.g.dart';

@freezed
class GeneralInfo with _$GeneralInfo {
  const factory GeneralInfo({
    required List<Unit> units,
    required List<SocialContact> socialContacts,
    required List<FinanceInfo> financeInfo,
    required List<Consultation> consultations,
  }) = _GeneralInfo;

  factory GeneralInfo.fromJson(Map<String, dynamic> json) =>
      _$GeneralInfoFromJson(json);
}