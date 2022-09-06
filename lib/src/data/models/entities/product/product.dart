// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'product.g.dart';
part 'product.freezed.dart';

@freezed
class Product with _$Product implements IModel {
  factory Product({
    required int id,
    @JsonKey(name: 'name') String? nameProduct,
    String? description,
    @Default(0) double price,
    @Default(1) int status,
    String? picture,
    String? category,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'store_id') required int storeId,
    @Default(0) int liked,
    @Default(0) int viewer,
    @Default(0) int sales,
    @JsonKey(name: 'total_sales') @Default(0) int totalSales,
  }) = _Product;

  @override
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
