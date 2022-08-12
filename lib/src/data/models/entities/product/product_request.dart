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
    required int categoryId,
    required int storeId,
  }) = _ProductAddRequest;
  @override
  factory ProductRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductRequestFromJson(json);
}
