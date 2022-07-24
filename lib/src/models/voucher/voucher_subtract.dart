import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../product_cart.dart';
import '../store/store_model.dart';

abstract class Voucher {
  Store? store;
  List<ProductCart>? productCarts;
  int shippingFee;
  int id;
  String name;
  Icon icon;
  String condition;
  Voucher({
    this.store,
    this.productCarts,
    this.shippingFee = 0,
    this.id = -1,
    this.name = "",
    this.icon = const Icon(FontAwesomeIcons.receipt),
    this.condition = "",
  });

  Widget widgetVoucher();
  double totalApply();
  Widget widgetApplyVoucher();

  @override
  String toString() {
    return 'Voucher(store: $store, productCarts: $productCarts, shippingFee: $shippingFee, id: $id, name: $name, icon: $icon, condition: $condition)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Voucher &&
        other.store == store &&
        listEquals(other.productCarts, productCarts) &&
        other.shippingFee == shippingFee &&
        other.id == id &&
        other.name == name &&
        other.icon == icon &&
        other.condition == condition;
  }

  @override
  int get hashCode {
    return store.hashCode ^
        productCarts.hashCode ^
        shippingFee.hashCode ^
        id.hashCode ^
        name.hashCode ^
        icon.hashCode ^
        condition.hashCode;
  }
}
