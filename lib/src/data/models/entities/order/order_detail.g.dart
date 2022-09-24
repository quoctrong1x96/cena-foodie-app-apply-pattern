// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OrderDetail _$_$_OrderDetailFromJson(Map<String, dynamic> json) {
  return _$_OrderDetail(
    id: json['id'] as int?,
    orderId: json['order_id'] as int?,
    productId: json['product_id'] as int?,
    nameProduct: json['product_name'] as String?,
    picture: json['picture'] as String?,
    quantity: json['quantity'] as int?,
    total: (json['total'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_OrderDetailToJson(_$_OrderDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'product_id': instance.productId,
      'product_name': instance.nameProduct,
      'picture': instance.picture,
      'quantity': instance.quantity,
      'total': instance.total,
    };
