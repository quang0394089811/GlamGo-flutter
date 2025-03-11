import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  final String code;
  final String? message;
  final T? data;

  BaseResponse({
    required this.code,
    this.message,
    this.data,
  });

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return BaseResponse<T>(
      code: json['code'],
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson(Object Function(T? value) toJsonT) {
    return {
      'code': code,
      'message': message,
      'data': data != null ? toJsonT(data) : null,
    };
  }
}
