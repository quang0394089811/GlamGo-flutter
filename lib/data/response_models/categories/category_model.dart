import 'package:json_annotation/json_annotation.dart';
import 'package:project_shop/data/base/base_response.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends BaseDataModel {
  int? id;
  String? name;
  String? description;
  String? slug;
  String? images;
  @JsonKey(name: "parent_id")
  int? parentId;
  @JsonKey(name: "parent_name")
  String? parentName;
  @JsonKey(name: "status_id")
  int? statusId;

  CategoryModel({
    this.id,
    this.name,
    this.description,
    this.slug,
    this.images,
    this.parentId,
    this.parentName,
    this.statusId,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  @override
  BaseDataModel fromJson(Map<String, dynamic> json) {
    return CategoryModel.fromJson(json);
  }
}
