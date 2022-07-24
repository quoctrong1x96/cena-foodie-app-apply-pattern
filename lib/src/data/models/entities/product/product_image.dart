import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'product_image.g.dart';
part 'product_image.freezed.dart';

@freezed
class ProductImage with _$ProductImage implements IModel {
  factory ProductImage({
    required int id,
    required String networkUrl,
    required int productId,
  }) = _ProductImage;

  @override
  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);
}
