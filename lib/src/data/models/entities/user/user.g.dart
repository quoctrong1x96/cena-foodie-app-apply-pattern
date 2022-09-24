// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as int,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    image: json['image'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    notificationToken: json['notification_token'] as String,
    rolId: json['rol_id'] as int,
    address: json['address'] as String?,
    reference: json['reference_code'] as String?,
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'image': instance.image,
      'email': instance.email,
      'phone': instance.phone,
      'notification_token': instance.notificationToken,
      'rol_id': instance.rolId,
      'address': instance.address,
      'reference_code': instance.reference,
    };
