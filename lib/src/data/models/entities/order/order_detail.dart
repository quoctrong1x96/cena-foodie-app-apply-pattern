// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'order_detail.freezed.dart';
part 'order_detail.g.dart';

@freezed
class OrderDetail with _$OrderDetail implements IModel {
  factory OrderDetail(
      {required int? id,
      @JsonKey(name: 'order_id') int? orderId,
      @JsonKey(name: 'product_id') int? productId,
      @JsonKey(name: 'product_name') String? nameProduct,
      String? picture,
      int? quantity,
      double? total}) = _OrderDetail;

  factory OrderDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailFromJson(json);
}
