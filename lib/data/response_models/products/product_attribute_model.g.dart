// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_attribute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductAttributeModel _$ProductAttributeModelFromJson(
        Map<String, dynamic> json) =>
    ProductAttributeModel(
      id: (json['id'] as num?)?.toInt(),
      productId: (json['product_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      attributeValue: (json['attribute_value'] as List<dynamic>?)
          ?.map((e) => AttributeValueModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductAttributeModelToJson(
        ProductAttributeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product_id': instance.productId,
      'name': instance.name,
      'attribute_value': instance.attributeValue,
    };

AttributeValueModel _$AttributeValueModelFromJson(Map<String, dynamic> json) =>
    AttributeValueModel(
      id: (json['id'] as num?)?.toInt(),
      productAttributeId: (json['productAttributeId'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$AttributeValueModelToJson(
        AttributeValueModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productAttributeId': instance.productAttributeId,
      'name': instance.name,
    };
