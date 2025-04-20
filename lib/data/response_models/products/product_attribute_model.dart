import 'package:json_annotation/json_annotation.dart';

part 'product_attribute_model.g.dart';

@JsonSerializable()
class ProductAttributeModel {
  int? id;
  @JsonKey(name: 'product_id')
  int? productId;
  String? name;
  @JsonKey(name: 'attribute_value')
  List<AttributeValueModel>? attributeValue;

  ProductAttributeModel({
    this.id,
    this.productId,
    this.name,
    this.attributeValue,
  });

  factory ProductAttributeModel.fromJson(Map<String, dynamic> json) =>
      _$ProductAttributeModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAttributeModelToJson(this);
}

@JsonSerializable()
class AttributeValueModel {
  int? id;
  int? productAttributeId;
  String? name;

  AttributeValueModel({
    this.id,
    this.productAttributeId,
    this.name,
  });
    factory AttributeValueModel.fromJson(Map<String, dynamic> json) =>
      _$AttributeValueModelFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeValueModelToJson(this);
}
