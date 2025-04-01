// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      slug: json['slug'] as String?,
      images: json['images'] as String?,
      parentId: (json['parent_id'] as num?)?.toInt(),
      parentName: json['parent_name'] as String?,
      statusId: (json['status_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'slug': instance.slug,
      'images': instance.images,
      'parent_id': instance.parentId,
      'parent_name': instance.parentName,
      'status_id': instance.statusId,
    };
