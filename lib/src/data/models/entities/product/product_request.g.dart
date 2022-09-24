// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductAddRequest _$_$_ProductAddRequestFromJson(Map<String, dynamic> json) {
  return _$_ProductAddRequest(
    name: json['name'] as String?,
    description: json['description'] as String?,
    price: (json['price'] as num?)?.toDouble() ?? 0,
    images:
        (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    category: json['category'] as String?,
    categoryId: json['category_id'] as int,
    storeId: json['store_id'] as int,
  );
}

Map<String, dynamic> _$_$_ProductAddRequestToJson(
        _$_ProductAddRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'images': instance.images,
      'category': instance.category,
      'category_id': instance.categoryId,
      'store_id': instance.storeId,
    };
