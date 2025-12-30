// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Unit _$UnitFromJson(Map<String, dynamic> json) => _Unit(
  id: json['id'] as String,
  address: json['address'] as String,
  workingTime: Map<String, String?>.from(json['workingTime'] as Map),
  contactPhone: json['contactPhone'] as String,
  socialUrl: json['socialUrl'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$UnitToJson(_Unit instance) => <String, dynamic>{
  'id': instance.id,
  'address': instance.address,
  'workingTime': instance.workingTime,
  'contactPhone': instance.contactPhone,
  'socialUrl': instance.socialUrl,
  'email': instance.email,
};
