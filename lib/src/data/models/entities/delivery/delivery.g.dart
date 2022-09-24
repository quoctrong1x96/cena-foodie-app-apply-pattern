// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Delivery _$_$_DeliveryFromJson(Map<String, dynamic> json) {
  return _$_Delivery(
    id: json['id'] as int,
    name: json['name'] as String?,
    phone: json['phone'] as String?,
    image: json['image'] as String?,
    notificationToken: json['notification_token'] as String?,
  );
}

Map<String, dynamic> _$_$_DeliveryToJson(_$_Delivery instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'image': instance.image,
      'notification_token': instance.notificationToken,
    };
