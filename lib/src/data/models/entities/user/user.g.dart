// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    image: json['image'] as String,
    email: json['email'] as String,
    rolId: json['rolId'] as int? ?? 2,
    address: json['address'] as String?,
    reference: json['reference'] as String?,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'image': instance.image,
      'email': instance.email,
      'rolId': instance.rolId,
      'address': instance.address,
      'reference': instance.reference,
    };
