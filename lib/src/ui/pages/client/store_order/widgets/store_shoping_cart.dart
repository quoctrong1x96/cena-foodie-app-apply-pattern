// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';

// import '../../../../blocs/cart/cart_bloc.dart';
// import '../../../../../utils/configs/cena_colors.dart';
// import '../../../../generated/l10n.dart';
// import '../../../../models/product_cart.dart';
// import '../../../../data/models/entities/store/store.dart';
// import '../../../../widgets/animation_route.dart';
// import '../../../../widgets/widgets.dart';
// import '../../cart/cart_client_page.dart';

// class StoreShopingCart extends StatelessWidget {
//   final Store store;
//   const StoreShopingCart({required this.store, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     int quantity = 0;
//     NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
//     double total = 0;
//     return GestureDetector(
//       onTap: () {
//         List<Store> listStore = [];
//         listStore.add(store);
//         Navigator.push(
//             context,
//             routeCena(
//                 page: CartClientPage(
//               listStore: listStore,
//             )));
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           color: CenaColors.WHITE,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.5),
//               spreadRadius: 2,
//               blurRadius: 2,
//               offset: const Offset(0.0, 4.0),
//             ),
//           ],
//         ),
//         child: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
//           if (state.products != null) {
//             final Iterable<ProductCart> productCarts =
//                 state.products!.where((element) => element.storeId == store.id);
//             if (productCarts.isNotEmpty) {
//               quantity = 0;
//               total = 0;
//               for (var element in productCarts) {
//                 quantity = quantity + element.quantity;
//                 total = total + element.quantity * element.price;
//               }
//             } else {
//               quantity = 0;
//               total = 0;
//             }
//           }
//           return quantity <= 0
//               ? const SizedBox(width: 1)
//               : Container(
//                   width: MediaQuery.of(context).size.width - 30,
//                   height: 50,
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   color: CenaColors.primary,
//                   child: Row(children: [
//                     Icon(Icons.shopping_bag, color: CenaColors.WHITE),
//                     const SizedBox(width: 10),
//                     CenaTextDescription(
//                       text:
//                           "$quantity ${S.of(context).client_store_order_item}",
//                       color: CenaColors.WHITE,
//                     ),
//                     const Expanded(child: SizedBox(width: 10)),
//                     CenaTextDescription(
//                         text:
//                             "${numberFormat.format((total).toInt()).toString()} vnđ",
//                         color: CenaColors.WHITE)
//                   ]),
//                 );
//         }),
//       ),
//     );
//   }
// }
