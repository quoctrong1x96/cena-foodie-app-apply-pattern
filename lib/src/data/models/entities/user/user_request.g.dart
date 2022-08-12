// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRequest _$_$_UserRequestFromJson(Map<String, dynamic> json) {
  return _$_UserRequest(
    email: json['email'] as String?,
    password: json['password'] as String?,
    numberPhone: json['numberPhone'] as String?,
    returnSecureToken: json['returnSecureToken'] as bool? ?? true,
  );
}

Map<String, dynamic> _$_$_UserRequestToJson(_$_UserRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'numberPhone': instance.numberPhone,
      'returnSecureToken': instance.returnSecureToken,
    };
