import 'package:flutter/material.dart';

import '../../../../data/models/entities/store/store.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../widgets/widgets.dart';
import 'widgets/body_store_order.dart';
import 'widgets/store_image_review.dart';
import 'widgets/store_shoping_cart.dart';

class StoreOrderPage extends StatefulWidget {
  final Store store;

  const StoreOrderPage(this.store, {Key? key}) : super(key: key);

  @override
  State<StoreOrderPage> createState() => _StoreOrderPageState();
}

class _StoreOrderPageState extends State<StoreOrderPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CenaColors.LIGHT_GREY,
      // appBar: CenaAppbarDefault(
      //   title: widget.store.storeName,
      //   leading: const CenaButtonDefaultBack(),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // backgroundColor: Colors.red,
            expandedHeight: size.height * 0.25,
            floating: true,
            pinned: true,
            title: Text(
              widget.store.storeName,
            ),
            leading: const CenaButtonDefaultBack(),
            flexibleSpace: FlexibleSpaceBar(
              background: StoreImageReview(
                store: widget.store,
                height: size.height * 0.25,
              ),
            ),
          ),
          // SliverPersistentHeader(
          //     delegate: _StoreAppbar(
          //         minExtented: kToolbarHeight,
          //         maxExtented: size.height * 0.20,
          //         size: size,
          //         store: widget.store)),
          SliverToBoxAdapter(
            child: Body(store: widget.store),
          )
        ],
      ),
      floatingActionButton: StoreShopingCart(store: widget.store),
    );
  }
}

// class _StoreAppbar extends SliverPersistentHeaderDelegate {
//   final double maxExtented;
//   final double minExtented;
//   final Size size;
//   final Store store;

//   const _StoreAppbar(
//       {required this.maxExtented,
//       required this.minExtented,
//       required this.size,
//       required this.store});

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return StoreImageReview(
//       store: store,
//       height: maxExtented,
//     );
//   }

//   @override
//   double get maxExtent => maxExtented;

//   @override
//   double get minExtent => minExtented;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
//       false;
// }
