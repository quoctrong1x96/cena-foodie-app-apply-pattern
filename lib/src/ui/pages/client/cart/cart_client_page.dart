// import 'package:cached_network_image/cached_network_image.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';

// import '../../../../utils/image_ultils.dart';
// import '../../../blocs/cart/cart_bloc.dart';
// import '../../../../utils/configs/cena_colors.dart';
// import '../../../configs/cena_text_styles.dart';
// import '../../../generated/l10n.dart';
// import '../../../models/product_cart.dart';
// import '../../../data/models/entities/store/store.dart';
// import '../../../services/url.dart';
// import '../../../widgets/animation_route.dart';
// import '../../../widgets/widgets.dart';
// import 'check_out_page.dart';

// class CartShowList {
//   Store store;
//   List<ProductCart> listProductCart;
//   CartShowList({required this.store, required this.listProductCart});
//   double total() {
//     double result = 0;
//     if (listProductCart.isNotEmpty) {
//       for (var product in listProductCart) {
//         result = result + product.quantity * product.price;
//       }
//     }
//     return result;
//   }

//   int quantity() {
//     int result = 0;
//     if (listProductCart.isNotEmpty) {
//       for (var product in listProductCart) {
//         result = result + product.quantity;
//       }
//     }
//     return result;
//   }
// }

// class CartClientPage extends StatelessWidget {
//   final List<Store>? listStore;
//   const CartClientPage({this.listStore, Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final lang = S.of(context);
//     String appbarHeader = lang.client_cart_checkout_appbar_header;
//     final cartBloc = BlocProvider.of<CartBloc>(context);
//     NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
//     return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
//       List<CartShowList> listCarts = [];
//       int otherQuantity = state.quantity;
//       double otherTotal = state.total;
//       if (listStore != null) {
//         Iterable<ProductCart> productCarts = [];
//         for (var storeItem in listStore!) {
//           appbarHeader = storeItem.storeName!;
//           productCarts = state.products!
//               .where((element) => element.storeId == storeItem.id);
//           List<ProductCart> listProduct = [];
//           for (var productcart in productCarts) {
//             listProduct.add(productcart);
//           }
//           if (listProduct.isNotEmpty) {
//             listCarts.add(
//                 CartShowList(store: storeItem, listProductCart: listProduct));
//           }
//         }
//       } else {
//         Iterable<ProductCart> productCarts = [];
//         List<int> listStore = [];
//         if (state.products != null) {
//           for (var product in state.products!) {
//             listStore.add(product.storeId);
//           }
//         }
//         if (listStore.isNotEmpty) {
//           for (var storeId in listStore) {
//             productCarts =
//                 state.products!.where((element) => element.storeId == storeId);
//             List<ProductCart> listProduct = [];
//             for (var productcart in productCarts) {
//               listProduct.add(productcart);
//             }
//             if (listProduct.isNotEmpty) {
//               listCarts.add(CartShowList(
//                   store: Store(
//                       id: storeId,
//                       storeName: lang.client_cart_checkout_looking_for),
//                   listProductCart: listProduct));
//             }
//           }
//         }
//       }
//       for (var item in listCarts) {
//         for (var productItem in item.listProductCart) {
//           otherQuantity -= productItem.quantity;
//           otherTotal -= productItem.price * productItem.quantity;
//         }
//       }

//       return Scaffold(
//         backgroundColor: CenaColors.LIGHT_GREY,
//         appBar: CenaAppbarDefault(
//           title: appbarHeader,
//           centerTitle: true,
//           leading: const CenaButtonDefaultBack(),
//           actions: [
//             Center(
//                 child: BlocBuilder<CartBloc, CartState>(
//                     builder: (context, state) => CenaTextDescription(
//                         text:
//                             '${state.quantity - otherQuantity} ${lang.client_cart_checkout_items}',
//                         fontSize: 17))),
//             const SizedBox(width: 10.0)
//           ],
//         ),
//         body: SafeArea(
//           child: Column(
//             children: [
//               Expanded(
//                 child: BlocBuilder<CartBloc, CartState>(
//                     builder: (context, state) => (state.quantityCart -
//                                 otherQuantity !=
//                             0)
//                         ? ListView.builder(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 5.0, vertical: 2),
//                             itemCount: listCarts[0].listProductCart.length,
//                             itemBuilder: (_, i) => Dismissible(
//                                   key: Key(listCarts[0]
//                                       .listProductCart[i]
//                                       .uidProduct),
//                                   direction: DismissDirection.endToStart,
//                                   background: Container(),
//                                   secondaryBackground: Container(
//                                     padding: const EdgeInsets.only(right: 35.0),
//                                     margin: const EdgeInsets.only(bottom: 15.0),
//                                     alignment: Alignment.centerRight,
//                                     decoration: const BoxDecoration(
//                                         color: Colors.red,
//                                         borderRadius: BorderRadius.only(
//                                             topRight: Radius.circular(20.0),
//                                             bottomRight: Radius.circular(5.0))),
//                                     child: Icon(Icons.delete_sweep_rounded,
//                                         color: CenaColors.WHITE, size: 40),
//                                   ),
//                                   onDismissed: (direccion) => cartBloc.add(
//                                       OnDeleteProductToCartByIdEvent(
//                                           listCarts[0]
//                                               .listProductCart[i]
//                                               .uidProduct)),
//                                   confirmDismiss:
//                                       (DismissDirection direction) async {
//                                     return await showDialog(
//                                       context: context,
//                                       builder: (BuildContext context) {
//                                         return AlertDialog(
//                                           title: CenaTextDescription(
//                                             text: lang
//                                                 .client_cart_checkout_dialog_tile,
//                                             fontSize: 16,
//                                           ),
//                                           content: CenaTextDescription(
//                                             text: lang
//                                                 .client_cart_checkout_dialog_message,
//                                             fontSize: 14,
//                                           ),
//                                           actions: <Widget>[
//                                             Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.spaceAround,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.center,
//                                               children: [
//                                                 InkWell(
//                                                     onTap: () =>
//                                                         Navigator.of(context)
//                                                             .pop(false),
//                                                     child: CenaTextDescription(
//                                                       text: lang
//                                                           .client_cart_checkout_dialog_confirm_no,
//                                                       fontSize: 14,
//                                                       color: CenaColors.primary,
//                                                     )),
//                                                 InkWell(
//                                                   onTap: () =>
//                                                       Navigator.of(context)
//                                                           .pop(true),
//                                                   child: CenaTextDescription(
//                                                     text: lang
//                                                         .client_cart_checkout_diolog_confirm_yes,
//                                                     fontSize: 14,
//                                                     color: CenaColors.GREY,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         );
//                                       },
//                                     );
//                                   },
//                                   child: Container(
//                                       height: 90,
//                                       alignment: Alignment.center,
//                                       margin:
//                                           const EdgeInsets.only(bottom: 2.0),
//                                       decoration: BoxDecoration(
//                                           color: CenaColors.WHITE,
//                                           borderRadius:
//                                               BorderRadius.circular(2.0)),
//                                       child: Row(
//                                         children: [
//                                           Container(
//                                             width: 100,
//                                             height: 100,
//                                             padding: const EdgeInsets.all(5.0),
//                                             decoration: BoxDecoration(
//                                                 image: DecorationImage(
//                                                     scale: 8,
//                                                     image: CachedNetworkImageProvider(
//                                                         ImagesUltils.getImageApiUrl(
//                                                             listCarts[0]
//                                                                 .listProductCart[
//                                                                     i]
//                                                                 .imageProduct)),
//                                                     fit: BoxFit.cover)),
//                                           ),
//                                           Container(
//                                             width: 130,
//                                             padding: const EdgeInsets.all(10.0),
//                                             child: Column(
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 CenaTextDescription(
//                                                     text: state.products![i]
//                                                         .nameProduct,
//                                                     fontWeight: FontWeight.w500,
//                                                     fontSize: 20),
//                                                 const SizedBox(height: 10.0),
//                                                 CenaTextDescription(
//                                                     text:
//                                                         '${numberFormat.format((listCarts[0].listProductCart[i].price * listCarts[0].listProductCart[i].quantity).toInt()).toString()} vnđ',
//                                                     color: CenaColors.primary)
//                                               ],
//                                             ),
//                                           ),
//                                           Expanded(
//                                             child: Row(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.center,
//                                               children: [
//                                                 Container(
//                                                     alignment: Alignment.center,
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             2.0),
//                                                     decoration: BoxDecoration(
//                                                         color: listCarts[0]
//                                                                     .listProductCart[
//                                                                         i]
//                                                                     .quantity >
//                                                                 1
//                                                             ? CenaColors.primary
//                                                             : CenaColors.GREY,
//                                                         shape: BoxShape.circle),
//                                                     child: InkWell(
//                                                       child: Icon(Icons.remove,
//                                                           color:
//                                                               CenaColors.WHITE),
//                                                       onTap: () {
//                                                         if (listCarts[0]
//                                                                 .listProductCart[
//                                                                     i]
//                                                                 .quantity >
//                                                             1) {
//                                                           cartBloc.add(
//                                                               OnDecreaseProductQuantityToCartByIdEvent(
//                                                                   listCarts[0]
//                                                                       .listProductCart[
//                                                                           i]
//                                                                       .uidProduct));
//                                                         }
//                                                       },
//                                                     )),
//                                                 const SizedBox(width: 10.0),
//                                                 CenaTextDescription(
//                                                     text:
//                                                         '${listCarts[0].listProductCart[i].quantity}',
//                                                     color: CenaColors.primary),
//                                                 const SizedBox(width: 10.0),
//                                                 Container(
//                                                     alignment: Alignment.center,
//                                                     padding:
//                                                         const EdgeInsets.all(
//                                                             2.0),
//                                                     decoration:
//                                                         const BoxDecoration(
//                                                             color: CenaColors
//                                                                 .primary,
//                                                             shape: BoxShape
//                                                                 .circle),
//                                                     child: InkWell(
//                                                         child: Icon(Icons.add,
//                                                             color: CenaColors
//                                                                 .WHITE),
//                                                         onTap: () => cartBloc.add(
//                                                             OnIncreaseQuantityProductToCartByIdEvent(
//                                                                 listCarts[0]
//                                                                     .listProductCart[
//                                                                         i]
//                                                                     .uidProduct))))
//                                               ],
//                                             ),
//                                           )
//                                         ],
//                                       )),
//                                 ))
//                         : _WithOutProducts()),
//               ),
//               Container(
//                 height: 110,
//                 // color: CenaColors.WHITE,
//                 decoration: BoxDecoration(
//                   color: CenaColors.WHITE,
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 2,
//                       blurRadius: 10,
//                       offset: const Offset(1, -3),
//                     ),
//                   ],
//                 ),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 5.0, vertical: 5.0),
//                   child: BlocBuilder<CartBloc, CartState>(
//                     builder: (context, state) => Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             CenaTextDescription(
//                                 text: lang.client_cart_checkout_total),
//                             CenaTextDescription(
//                               text:
//                                   '${numberFormat.format((state.total - otherTotal).toInt()).toString()} vnđ',
//                               textStyle: CenaTextStyles.blackS18Bold,
//                             ),
//                           ],
//                         ),
//                         CenaButton(
//                           text: lang.client_cart_checkout_button_checkout,
//                           height: 45,
//                           fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                           color: (state.quantityCart - otherQuantity != 0)
//                               ? CenaColors.primary
//                               : CenaColors.GREY,
//                           onPressed: () {
//                             if (state.quantityCart - otherQuantity != 0) {
//                               Navigator.push(
//                                   context,
//                                   routeCena(
//                                       page: CheckOutPage(
//                                           listStore!.elementAt(0))));
//                             }
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }

// class _WithOutProducts extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SvgPicture.asset('Assets/empty-cart.svg', height: 350),
//         CenaTextDescription(
//           text: S.of(context).client_cart_checkout_without_product,
//           fontSize: 21,
//           fontWeight: FontWeight.w500,
//           color: CenaColors.primary,
//         )
//       ],
//     );
//   }
// }
