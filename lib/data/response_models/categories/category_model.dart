import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  int? id;
  String? name;
  String? description;
  String? slug;
  String? images;
  @JsonKey(name: "parent_id")
  int? parentId;
  @JsonKey(name: "parent_name")
  String? parentName;
  @JsonKey(name: "status")
  int? status;

  CategoryModel({
    this.id,
    this.name,
    this.description,
    this.slug,
    this.images,
    this.parentId,
    this.parentName,
    this.status,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

}
