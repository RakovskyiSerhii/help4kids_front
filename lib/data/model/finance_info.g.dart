// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FinanceInfo _$FinanceInfoFromJson(Map<String, dynamic> json) => _FinanceInfo(
  id: json['id'] as String,
  tNumber: json['tNumber'] as String,
  name: json['name'] as String,
  officialAddress: json['officialAddress'] as String,
  actualAddress: json['actualAddress'] as String,
);

Map<String, dynamic> _$FinanceInfoToJson(_FinanceInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tNumber': instance.tNumber,
      'name': instance.name,
      'officialAddress': instance.officialAddress,
      'actualAddress': instance.actualAddress,
    };
