// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      id: (json['id'] as num).toInt(),
      categoryArticleId: (json['category_artical_id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      title: json['title'] as String?,
      metaTitle: json['meta_tittle'] as String?,
      metaDescription: json['meta_description'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
      content: json['content'] as String?,
      status: (json['status'] as num?)?.toInt(),
      isHot: (json['is_hot'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_artical_id': instance.categoryArticleId,
      'product_id': instance.productId,
      'title': instance.title,
      'meta_tittle': instance.metaTitle,
      'meta_description': instance.metaDescription,
      'slug': instance.slug,
      'image': instance.image,
      'content': instance.content,
      'status': instance.status,
      'is_hot': instance.isHot,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
