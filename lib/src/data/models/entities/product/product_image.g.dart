// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductImage _$_$_ProductImageFromJson(Map<String, dynamic> json) {
  return _$_ProductImage(
    id: json['id'] as int,
    networkUrl: json['url'] as String,
    productId: json['product_id'] as int,
  );
}

Map<String, dynamic> _$_$_ProductImageToJson(_$_ProductImage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.networkUrl,
      'product_id': instance.productId,
    };
