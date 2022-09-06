// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cart _$_$_CartFromJson(Map<String, dynamic> json) {
  return _$_Cart(
    storeId: json['store_id'] as int,
    productId: json['product_id'] as int,
    productImage: json['product_image'] as String,
    productName: json['product_name'] as String,
    price: (json['price'] as num).toDouble(),
    quantity: json['quantity'] as int,
  );
}

Map<String, dynamic> _$_$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'store_id': instance.storeId,
      'product_id': instance.productId,
      'product_image': instance.productImage,
      'product_name': instance.productName,
      'price': instance.price,
      'quantity': instance.quantity,
    };
