// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    BaseResponse<T>(
      message: json['message'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      errorCode: (json['status'] as num?)?.toInt(),
      currentPage: (json['current_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      perPage: (json['per_page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'status': instance.errorCode,
      'current_page': instance.currentPage,
      'total': instance.total,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

BaseMessModel _$BaseMessModelFromJson(Map<String, dynamic> json) =>
    BaseMessModel(
      errorCode: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BaseMessModelToJson(BaseMessModel instance) =>
    <String, dynamic>{
      'status': instance.errorCode,
      'message': instance.message,
    };
