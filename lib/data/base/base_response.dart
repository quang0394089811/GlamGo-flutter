import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final String? message;

  final T? data;
  
  @JsonKey(name: 'status')
  final int? errorCode;
  
  @JsonKey(name: 'current_page')
  final int? currentPage;

  final int? total;

  @JsonKey(name: 'last_page')
  final int? lastPage;

  @JsonKey(name: 'per_page')
  final int? perPage;

  BaseResponse({
    required this.message,
    required this.data,
    required this.errorCode,
    required this.currentPage,
    required this.total,
    required this.lastPage,
    required this.perPage,
  });
  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}

@JsonSerializable()
class BaseMessModel {
  @JsonKey(name: 'status')
  final int? errorCode;
  final String? message;

  BaseMessModel({required this.errorCode, required this.message});

  Map<String, dynamic> toJson() => _$BaseMessModelToJson(this);

  factory BaseMessModel.fromJson(Map<String, dynamic> json) =>
      _$BaseMessModelFromJson(json);
}
