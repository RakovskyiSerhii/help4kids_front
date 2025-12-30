// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ArticleCategory _$ArticleCategoryFromJson(Map<String, dynamic> json) =>
    _ArticleCategory(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      featured: json['featured'] as bool? ?? false,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ArticleCategoryToJson(_ArticleCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'featured': instance.featured,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
