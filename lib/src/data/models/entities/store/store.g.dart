// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Store _$_$_StoreFromJson(Map<String, dynamic> json) {
  return _$_Store(
    id: json['id'] as int,
    storeName: json['name'] as String,
    address: json['address'] as String?,
    latitude: json['latitude'] as String,
    longitude: json['longitude'] as String,
    openTime: json['open_time'] as String,
    closeTime: json['close_time'] as String,
    distance: (json['distance_in_km'] as num?)?.toDouble(),
    categories: json['categories'] as String?,
    image: json['image'] as String?,
    userId: json['user_id'] as int?,
  );
}

Map<String, dynamic> _$_$_StoreToJson(_$_Store instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.storeName,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'open_time': instance.openTime,
      'close_time': instance.closeTime,
      'distance_in_km': instance.distance,
      'categories': instance.categories,
      'image': instance.image,
      'user_id': instance.userId,
    };
