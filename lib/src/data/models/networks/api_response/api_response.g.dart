// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiResponse<T> _$_$_ApiResponseFromJson<T>(Map<String, dynamic> json) {
  return _$_ApiResponse<T>(
    success: _dataFromJson(json['success'] as Map<String, dynamic>?),
    code: _dataFromJson(json['code'] as Map<String, dynamic>?),
    message: _dataFromJson(json['message'] as Map<String, dynamic>?),
    data: _dataFromJson(json['data'] as Map<String, dynamic>?),
  );
}

Map<String, dynamic> _$_$_ApiResponseToJson<T>(_$_ApiResponse<T> instance) =>
    <String, dynamic>{
      'success': _dataToJson(instance.success),
      'code': _dataToJson(instance.code),
      'message': _dataToJson(instance.message),
      'data': _dataToJson(instance.data),
    };
