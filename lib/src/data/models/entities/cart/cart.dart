// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'cart.freezed.dart';
part 'cart.g.dart';

@freezed
class Cart with _$Cart implements IModel {
  factory Cart({
    required int storeId,
    required int productId,
    required String productImage,
    required String productName,
    required double price,
    required int quantity,
  }) = _Cart;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
}

extension CartExtension on Cart {
  // set quantityX(int value) => quantity = value;
  // int get quantity => this.quantity;

  Cart increament({required int inputQuantity}) =>
      copyWith(quantity: quantity + inputQuantity);
  Cart decrement({required int inputQuantity}) => inputQuantity < quantity
      ? copyWith(quantity: quantity - inputQuantity)
      : copyWith(quantity: 0);
  Cart setQuantity({required int inputQuantity}) => inputQuantity < 0
      ? copyWith(quantity: inputQuantity)
      : copyWith(quantity: 0);
}
