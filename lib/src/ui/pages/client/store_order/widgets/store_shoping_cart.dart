import 'package:cenafoodie/src/data/models/ui/page_arguments.dart';
import 'package:cenafoodie/src/utils/constants/route_constants.dart';
import 'package:cenafoodie/src/utils/navigation_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../data/models/entities/cart/cart.dart';
import '../../../../../data/models/entities/store/store.dart';
import '../../../../blocs/cart/cart_bloc.dart';
import '../../../../../utils/configs/cena_colors.dart';
import '../../../../resources/generated/l10n.dart';
import '../../../../widgets/animation_route.dart';
import '../../../../widgets/widgets.dart';

class StoreShopingCart extends StatelessWidget {
  final Store store;
  const StoreShopingCart({required this.store, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int quantity = 0;
    NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
    double total = 0;
    return GestureDetector(
      onTap: () {
        List<Store> listStore = [];
        listStore.add(store);
        NavigationUtils.push(context, RouteConstants.cart_client,
            args: PageArguments(data: {'stores': listStore}));
      },
      child: Container(
        decoration: BoxDecoration(
          color: CenaColors.WHITE,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0.0, 4.0),
            ),
          ],
        ),
        child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state.products != null) {
            final Iterable<Cart> carts =
                state.products!.where((element) => element.storeId == store.id);
            if (carts.isNotEmpty) {
              quantity = 0;
              total = 0;
              for (var element in carts) {
                quantity = quantity + element.quantity;
                total = total + element.quantity * element.price;
              }
            } else {
              quantity = 0;
              total = 0;
            }
          }
          return quantity <= 0
              ? const SizedBox(width: 1)
              : Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: CenaColors.primary,
                  child: Row(children: [
                    Icon(Icons.shopping_bag, color: CenaColors.WHITE),
                    const SizedBox(width: 10),
                    CenaTextDescription(
                      text:
                          "$quantity ${S.of(context).client_store_order_item}",
                      color: CenaColors.WHITE,
                    ),
                    const Expanded(child: SizedBox(width: 10)),
                    CenaTextDescription(
                        text:
                            "${numberFormat.format((total).toInt()).toString()} vnđ",
                        color: CenaColors.WHITE)
                  ]),
                );
        }),
      ),
    );
  }
}
