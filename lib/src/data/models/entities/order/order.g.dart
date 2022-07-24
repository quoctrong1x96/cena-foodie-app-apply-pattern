// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Order _$_$_OrderFromJson(Map<String, dynamic> json) {
  return _$_Order(
    id: json['order_id'] as int,
    deliveryId: json['delivery_id'] as int?,
    deliveryName: json['delivery'] as String?,
    deliveryImage: json['deliveryImage'] as String?,
    clientId: json['client_id'] as int?,
    client: json['client'] as String?,
    clientImage: json['clientImage'] as String?,
    clientPhone: json['clientPhone'] as String?,
    addressId: json['address_id'] as int?,
    address: json['address'] as String?,
    receiver: json['receiver'] as String?,
    latitude: json['Latitude'] as String?,
    longitude: json['Longitude'] as String?,
    status: json['status'] as String?,
    payType: json['pay_type'] as String?,
    amount: (json['amount'] as num?)?.toDouble(),
    currentDate: json['currentDate'] == null
        ? null
        : DateTime.parse(json['currentDate'] as String),
    storeId: json['store_id'] as int?,
    storeLatitude: json['store_latitude'] as String?,
    storeLongitude: json['store_longitude'] as String?,
  );
}

Map<String, dynamic> _$_$_OrderToJson(_$_Order instance) => <String, dynamic>{
      'order_id': instance.id,
      'delivery_id': instance.deliveryId,
      'delivery': instance.deliveryName,
      'deliveryImage': instance.deliveryImage,
      'client_id': instance.clientId,
      'client': instance.client,
      'clientImage': instance.clientImage,
      'clientPhone': instance.clientPhone,
      'address_id': instance.addressId,
      'address': instance.address,
      'receiver': instance.receiver,
      'Latitude': instance.latitude,
      'Longitude': instance.longitude,
      'status': instance.status,
      'pay_type': instance.payType,
      'amount': instance.amount,
      'currentDate': instance.currentDate?.toIso8601String(),
      'store_id': instance.storeId,
      'store_latitude': instance.storeLatitude,
      'store_longitude': instance.storeLongitude,
    };
