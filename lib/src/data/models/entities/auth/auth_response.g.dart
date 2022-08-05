// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthResponse _$_$_AuthResponseFromJson(Map<String, dynamic> json) {
  return _$_AuthResponse(
    token: json['token'] as String,
    store: json['store'] == null
        ? null
        : Store.fromJson(json['store'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_AuthResponseToJson(_$_AuthResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'store': instance.store,
      'user': instance.user,
    };
