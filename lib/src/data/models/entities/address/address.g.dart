// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$_$_AddressFromJson(Map<String, dynamic> json) {
  return _$_Address(
    id: json['id'] as int,
    detail: json['detail'] as String?,
    receiver: json['receiver'] == null
        ? null
        : Receiver.fromJson(json['receiver'] as Map<String, dynamic>),
    type: json['type'] as int?,
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
  );
}

Map<String, dynamic> _$_$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'id': instance.id,
      'detail': instance.detail,
      'receiver': instance.receiver,
      'type': instance.type,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
