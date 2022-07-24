// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$_$_ProductFromJson(Map<String, dynamic> json) {
  return _$_Product(
    id: json['id'] as int,
    nameProduct: json['nameProduct'] as String?,
    description: json['description'] as String?,
    price: (json['price'] as num?)?.toDouble() ?? 0,
    status: json['status'] as int? ?? 1,
    picture: json['picture'] as String?,
    category: json['category'] as String?,
    categoryId: json['categoryId'] as int,
    storeId: json['storeId'] as int,
    liked: json['liked'] as int? ?? 0,
    viewer: json['viewer'] as int? ?? 0,
    sales: json['sales'] as int? ?? 0,
    totalSales: json['totalSales'] as int? ?? 0,
  );
}

Map<String, dynamic> _$_$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nameProduct': instance.nameProduct,
      'description': instance.description,
      'price': instance.price,
      'status': instance.status,
      'picture': instance.picture,
      'category': instance.category,
      'categoryId': instance.categoryId,
      'storeId': instance.storeId,
      'liked': instance.liked,
      'viewer': instance.viewer,
      'sales': instance.sales,
      'totalSales': instance.totalSales,
    };
