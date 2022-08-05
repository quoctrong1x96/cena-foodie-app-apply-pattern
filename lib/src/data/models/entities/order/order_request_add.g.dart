// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_request_add.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderRequestAdd _$_$_OrderRequestAddFromJson(Map<String, dynamic> json) {
  return _$_OrderRequestAdd(
    addressId: json['uidAddress'] as int,
    total: (json['total'] as num).toDouble(),
    typePayment: json['typePayment'] as String,
    carts: (json['products'] as List<dynamic>)
        .map((e) => Cart.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_OrderRequestAddToJson(_$_OrderRequestAdd instance) =>
    <String, dynamic>{
      'uidAddress': instance.addressId,
      'total': instance.total,
      'typePayment': instance.typePayment,
      'products': instance.carts,
    };
