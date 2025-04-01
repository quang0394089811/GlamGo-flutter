// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(Map<String, dynamic> json) =>
    BaseResponse<T>(
      result: BaseResultModel.fromJson(json['result'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseResponseToJson<T>(BaseResponse<T> instance) =>
    <String, dynamic>{
      'result': instance.result,
    };

BaseResultModel _$BaseResultModelFromJson(Map<String, dynamic> json) =>
    BaseResultModel(
      mess: BaseMessModel.fromJson(json['mess'] as Map<String, dynamic>),
      data: json['data'],
      timestamp: (json['timestamp'] as num?)?.toInt(),
    );

Map<String, dynamic> _$BaseResultModelToJson(BaseResultModel instance) =>
    <String, dynamic>{
      'mess': instance.mess,
      'data': instance.data,
      'timestamp': instance.timestamp,
    };

BaseMessModel _$BaseMessModelFromJson(Map<String, dynamic> json) =>
    BaseMessModel(
      errorCode: (json['errorCode'] as num).toInt(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$BaseMessModelToJson(BaseMessModel instance) =>
    <String, dynamic>{
      'errorCode': instance.errorCode,
      'message': instance.message,
    };
