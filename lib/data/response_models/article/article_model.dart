import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  final int id;
  @JsonKey(name: 'category_artical_id')
  final int? categoryArticleId;
  @JsonKey(name: 'product_id')
  final int? productId;
  final String? title;
  @JsonKey(name: 'meta_tittle')
  final String? metaTitle;
  @JsonKey(name: 'meta_description')
  final String? metaDescription;
  final String? slug;
  final String? image;
  final String? content;
  final int? status;
  @JsonKey(name: 'is_hot')
  final int? isHot;
  final String? createdAt;
  final String? updatedAt;

  ArticleModel({
    required this.id,
    required this.categoryArticleId,
    required this.productId,
    required this.title,
    required this.metaTitle,
    required this.metaDescription,
    required this.slug,
    required this.image,
    required this.content,
    required this.status,
    required this.isHot,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);
  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
