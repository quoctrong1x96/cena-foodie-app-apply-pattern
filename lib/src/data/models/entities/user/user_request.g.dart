// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserRequest _$_$_UserRequestFromJson(Map<String, dynamic> json) {
  return _$_UserRequest(
    email: json['email'] as String?,
    password: json['password'] as String?,
    numberPhone: json['phone'] as String?,
    returnSecureToken: json['returnSecureToken'] as bool? ?? true,
  );
}

Map<String, dynamic> _$_$_UserRequestToJson(_$_UserRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'phone': instance.numberPhone,
      'returnSecureToken': instance.returnSecureToken,
    };
