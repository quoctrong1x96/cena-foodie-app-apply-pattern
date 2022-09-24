// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'product_image.g.dart';
part 'product_image.freezed.dart';

@freezed
class ProductImage with _$ProductImage implements IModel {
  factory ProductImage({
    required int id,
    @JsonKey(name: 'url') required String networkUrl,
    @JsonKey(name: 'product_id') required int productId,
  }) = _ProductImage;

  @override
  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);
}
