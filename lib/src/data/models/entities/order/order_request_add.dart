// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';
import '../cart/cart.dart';

part 'order_request_add.freezed.dart';
part 'order_request_add.g.dart';

@freezed
class OrderRequestAdd with _$OrderRequestAdd implements IModel {
  factory OrderRequestAdd(
      {@JsonKey(name: 'address_id') required int addressId,
      required double total,
      @JsonKey(name: 'type_payment') required String typePayment,
      @JsonKey(name: 'products') required List<Cart> carts}) = _OrderRequestAdd;

  factory OrderRequestAdd.fromJson(Map<String, dynamic> json) =>
      _$OrderRequestAddFromJson(json);
}
