// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$_$_StoreFromJson(Map<String, dynamic> json) {
  return _$_Store(
    id: json['id'] as int,
    storeName: json['storeName'] as String,
    address: json['address'] as String?,
    latitude: json['latitude'] as String,
    longitude: json['longitude'] as String,
    openTime: json['openTime'] as String,
    closeTime: json['closeTime'] as String,
    distance: json['distance'] as String?,
    categories: json['categories'] as String?,
    image: json['image'] as String?,
    userId: json['userId'] as int?,
  );
}

Map<String, dynamic> _$_$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'id': instance.id,
      'storeName': instance.storeName,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
      'distance': instance.distance,
      'categories': instance.categories,
      'image': instance.image,
      'userId': instance.userId,
    };
