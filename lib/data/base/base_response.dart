import 'package:json_annotation/json_annotation.dart';
import 'package:project_shop/data/response_models/categories/category_model.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse<T> {
  final BaseResultModel result;

  BaseResponse({required this.result});

  Map<String, dynamic> toJson() => _$BaseResponseToJson<T>(this);

  factory BaseResponse.fromJson(Map<String, dynamic> json, CategoryModel Function(dynamic json) param1) =>
      _$BaseResponseFromJson<T>(json);
}

@JsonSerializable()
class BaseResultModel {
  final BaseMessModel mess;

  final dynamic data;
  final int? timestamp;

  BaseResultModel({required this.mess, required this.data, this.timestamp});

  Map<String, dynamic> toJson() => _$BaseResultModelToJson(this);

  factory BaseResultModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResultModelFromJson(json);
}

abstract class BaseDataModel {
  BaseDataModel();

  Map<String, dynamic> toJson();

  BaseDataModel.fromJson(Map<String, dynamic> json);
}

@JsonSerializable()
class BaseMessModel {
  final int errorCode;
  final String message;

  BaseMessModel({required this.errorCode, required this.message});

  Map<String, dynamic> toJson() => _$BaseMessModelToJson(this);

  factory BaseMessModel.fromJson(Map<String, dynamic> json) =>
      _$BaseMessModelFromJson(json);
}

class JsonStringToInt implements JsonConverter<int, dynamic> {
  const JsonStringToInt();

  @override
  int fromJson(dynamic json) {
    try {
      if (json == null) {
        return 0;
      }
      if (json is num) {
        return json.toInt();
      }
      return int.tryParse(json) ?? 0;
    } on Exception catch (_) {
      return 0;
    }
  }

  @override
  String toJson(int object) => object.toString();
}
