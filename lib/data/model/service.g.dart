// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Service _$ServiceFromJson(Map<String, dynamic> json) => _Service(
  id: json['id'] as String,
  categoryId: json['categoryId'] as String,
  title: json['title'] as String,
  shortDescription: json['shortDescription'] as String,
  longDescription: json['longDescription'] as String?,
  image: json['image'] as String?,
  icon: json['icon'] as String,
  price: json['price'] as Map<String, dynamic>,
  duration: (json['duration'] as num?)?.toInt(),
  featured: json['featured'] as bool? ?? false,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  createdBy: json['createdBy'] as String?,
  updatedBy: json['updatedBy'] as String?,
);

Map<String, dynamic> _$ServiceToJson(_Service instance) => <String, dynamic>{
  'id': instance.id,
  'categoryId': instance.categoryId,
  'title': instance.title,
  'shortDescription': instance.shortDescription,
  'longDescription': instance.longDescription,
  'image': instance.image,
  'icon': instance.icon,
  'price': instance.price,
  'duration': instance.duration,
  'featured': instance.featured,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'createdBy': instance.createdBy,
  'updatedBy': instance.updatedBy,
};
