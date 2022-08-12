import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../ui/widgets/widgets.dart';
import '../../../../utils/configs/cena_text_styles.dart';
import '../cart/cart.dart';
import '../store/store.dart';
import 'voucher_subtract.dart';

class CenaVoucherFreeShip implements Voucher {
  @override
  String condition;

  @override
  int shippingFee;

  @override
  Icon icon;

  @override
  int id;

  @override
  String name;

  @override
  List<Cart>? productCarts;

  @override
  Store? store;

  CenaVoucherFreeShip(
      {this.store,
      this.productCarts,
      this.condition = "",
      this.id = -1,
      this.shippingFee = 0,
      this.icon = const Icon(FontAwesomeIcons.receipt),
      this.name = ""})
      : super();

  @override
  double totalApply() {
    if (productCarts != null && store != null) {
      double total = 0;
      for (var product in productCarts!) {
        total += product.price * product.quantity;
      }
      return total;
    } else {
      return 0;
    }
  }

  @override
  Widget widgetApplyVoucher() {
    NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CenaTextDescription(
          text: 'Miễn phí giao hàng',
          textStyle: CenaTextStyles.blackS14,
        ),
        CenaTextDescription(
            fontSize: 14,
            text: '-${numberFormat.format(shippingFee).toString()} vnđ')
      ],
    );
  }

  @override
  Widget widgetVoucher() {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon,
              const SizedBox(width: 5 / 0),
              CenaTextDescription(
                text: name,
                textStyle: CenaTextStyles.blackS14,
              ),
            ],
          ),
        ]);
  }
}
