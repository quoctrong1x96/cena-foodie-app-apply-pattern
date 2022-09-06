// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'product_request.freezed.dart';
part 'product_request.g.dart';

@freezed
class ProductRequest with _$ProductRequest implements IModel {
  factory ProductRequest({
    String? name,
    String? description,
    @Default(0) double price,
    List<String>? images,
    String? category,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'store_id') required int storeId,
  }) = _ProductAddRequest;
  @override
  factory ProductRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductRequestFromJson(json);
}
