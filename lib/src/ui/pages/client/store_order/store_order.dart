import 'package:flutter/material.dart';

import '../../../../data/models/entities/store/store.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../widgets/widgets.dart';
import 'widgets/body_store_order.dart';
import 'widgets/store_shoping_cart.dart';

class StoreOrderPage extends StatelessWidget {
  final Store store;

  const StoreOrderPage(this.store, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CenaColors.LIGHT_GREY,
      appBar: CenaAppbarDefault(
        title: store.storeName!,
        leading: const CenaButtonDefaultBack(),
      ),
      body: Body(store: store),
      floatingActionButton: StoreShopingCart(store: store),
    );
  }
}
