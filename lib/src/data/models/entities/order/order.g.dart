// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$_$_OrderFromJson(Map<String, dynamic> json) {
  return _$_Order(
    id: json['id'] as int,
    deliveryId: json['delivery_id'] as int?,
    deliveryName: json['delivery'] as String?,
    deliveryImage: json['delivery_image'] as String?,
    clientId: json['client_id'] as int?,
    client: json['client'] as String?,
    clientImage: json['client_image'] as String?,
    clientPhone: json['client_phone'] as String?,
    addressId: json['address_id'] as int?,
    address: json['address'] as String?,
    receiver: json['receiver'] as String?,
    latitude: json['latitude'] as String?,
    longitude: json['longitude'] as String?,
    status: json['status'] as String?,
    payType: json['pay_type'] as String?,
    amount: (json['amount'] as num?)?.toDouble(),
    currentDate: json['update_date'] == null
        ? null
        : DateTime.parse(json['update_date'] as String),
    storeId: json['store_id'] as int?,
    storeLatitude: json['store_latitude'] as String?,
    storeLongitude: json['store_longitude'] as String?,
  );
}

Map<String, dynamic> _$_$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'id': instance.id,
      'delivery_id': instance.deliveryId,
      'delivery': instance.deliveryName,
      'delivery_image': instance.deliveryImage,
      'client_id': instance.clientId,
      'client': instance.client,
      'client_image': instance.clientImage,
      'client_phone': instance.clientPhone,
      'address_id': instance.addressId,
      'address': instance.address,
      'receiver': instance.receiver,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'status': instance.status,
      'pay_type': instance.payType,
      'amount': instance.amount,
      'update_date': instance.currentDate?.toIso8601String(),
      'store_id': instance.storeId,
      'store_latitude': instance.storeLatitude,
      'store_longitude': instance.storeLongitude,
    };
