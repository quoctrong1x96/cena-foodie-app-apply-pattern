// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Cart _$_$_CartFromJson(Map<String, dynamic> json) {
  return _$_Cart(
    storeId: json['storeId'] as int,
    productId: json['productId'] as int,
    productImage: json['productImage'] as String,
    productName: json['productName'] as String,
    price: (json['price'] as num).toDouble(),
    quantity: json['quantity'] as int,
  );
}

Map<String, dynamic> _$_$_CartToJson(_$_Cart instance) => <String, dynamic>{
      'storeId': instance.storeId,
      'productId': instance.productId,
      'productImage': instance.productImage,
      'productName': instance.productName,
      'price': instance.price,
      'quantity': instance.quantity,
    };
