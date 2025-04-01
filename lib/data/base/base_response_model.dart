import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponseModel<T> {
  @JsonKey(name: 'current_page')
  final int currentPage;

  final List<T> data;

  @JsonKey(name: 'first_page_url')
  final String firstPageUrl;

  final int from;

  @JsonKey(name: 'last_page')
  final int lastPage;

  @JsonKey(name: 'last_page_url')
  final String lastPageUrl;

  final List<Link> links;

  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;

  final String path;

  @JsonKey(name: 'per_page')
  final int perPage;

  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;

  final int to;

  final int total;

  BaseResponseModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BaseResponseModelFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) => _$BaseResponseModelToJson(this, toJsonT);
}

@JsonSerializable()
class Link {
  final String? url;
  final String label;
  final bool active;

  Link({
    this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
