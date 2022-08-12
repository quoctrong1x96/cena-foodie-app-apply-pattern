// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';

// import '../../../../utils/image_ultils.dart';
// import '../../../blocs/cart/cart_bloc.dart';
// import '../../../blocs/store/store_bloc.dart';
// import '../../../../utils/configs/cena_colors.dart';
// import '../../../controllers/products_controller.dart';
// import '../../../generated/l10n.dart';
// import '../../../models/product_cart.dart';
// import '../../../models/response/images_products_response.dart';
// import '../../../models/response/products_top_home_response.dart';
// import '../../../services/url.dart';
// import '../../../widgets/widgets.dart';

// class DetailsProductPage extends StatefulWidget {
//   final FoodAndDrink product;
//   final int storeId;

//   const DetailsProductPage(
//       {Key? key, required this.product, required this.storeId})
//       : super(key: key);

//   @override
//   _DetailsProductPageState createState() => _DetailsProductPageState();
// }

// class _DetailsProductPageState extends State<DetailsProductPage> {
//   bool isLoading = false;
//   List<ImageProductDb> imagesProducts = [];
//   String firstCount = "-1";
//   ProductCart currentProduct = ProductCart(
//       storeId: 1,
//       uidProduct: "1",
//       imageProduct: "",
//       nameProduct: "",
//       price: 1,
//       quantity: 1);
//   _getImageProducts() async {
//     imagesProducts = await productController.getImagesProducts(
//         BlocProvider.of<StoreBloc>(context).state.store!.id!,
//         widget.product.id.toString());
//     if (mounted) {
//       setState(() {
//         isLoading = true;
//       });
//     }
//   }

//   @override
//   void initState() {
//     _getImageProducts();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final cartBloc = BlocProvider.of<CartBloc>(context);
//     NumberFormat numberFormat = NumberFormat('###,###', 'en_US');

//     return Scaffold(
//       appBar: CenaAppbarDefault(
//         leading: CenaButtonDefaultBack(
//           action: () {
//             if (firstCount == "-1" || firstCount == "0") {
//               cartBloc.add(OnClearQuantityEvent(
//                   currentProduct.uidProduct, widget.storeId));
//             } else {
//               cartBloc.add(OnResetQuantityEvent(currentProduct.uidProduct,
//                   widget.storeId, int.parse(firstCount)));
//             }
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           SizedBox(
//               height: 30,
//               width: 30,
//               child: Icon(
//                 Icons.favorite_border_outlined,
//                 size: 20,
//                 color: CenaColors.WHITE,
//               ))
//         ],
//         title: widget.product.nameProduct,
//       ),
//       body: BlocBuilder<CartBloc, CartState>(builder: (context, state) {
//         if (firstCount == "-1") {
//           if (state.products != null) {
//             currentProduct = state.products!.firstWhere(
//                 (e) =>
//                     e.uidProduct == widget.product.id.toString() &&
//                     e.storeId == widget.storeId, orElse: () {
//               final product = ProductCart(
//                   storeId: widget.storeId,
//                   uidProduct: widget.product.id.toString(),
//                   imageProduct: widget.product.picture,
//                   nameProduct: widget.product.nameProduct,
//                   price: widget.product.price,
//                   quantity: 1);
//               cartBloc.add(OnAddProductToCartEvent(product, widget.storeId));
//               return product;
//             });
//             firstCount = state.products!
//                 .firstWhere(
//                     (e) =>
//                         e.uidProduct == widget.product.id.toString() &&
//                         e.storeId == widget.storeId,
//                     orElse: () => ProductCart(
//                         storeId: widget.storeId,
//                         uidProduct: widget.product.id.toString(),
//                         imageProduct: widget.product.picture,
//                         nameProduct: widget.product.nameProduct,
//                         price: widget.product.price,
//                         quantity: 0))
//                 .quantity
//                 .toString();
//           } else {
//             currentProduct = ProductCart(
//                 storeId: widget.storeId,
//                 uidProduct: widget.product.id.toString(),
//                 imageProduct: widget.product.picture,
//                 nameProduct: widget.product.nameProduct,
//                 price: widget.product.price,
//                 quantity: 1);
//             firstCount = "0";
//             cartBloc
//                 .add(OnAddProductToCartEvent(currentProduct, widget.storeId));
//           }
//         }
//         return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             (isLoading)
//                 ? Column(
//                     children: [
//                       const SizedBox(height: 2.0),
//                       Hero(
//                         tag: widget.product.id,
//                         child: SizedBox(
//                           width: MediaQuery.of(context).size.width,
//                           child: CarouselSlider.builder(
//                             itemCount: imagesProducts.length,
//                             options: CarouselOptions(
//                                 viewportFraction: 1.0, autoPlay: true),
//                             itemBuilder: (context, i, realIndex) => SizedBox(
//                               width: size.width,
//                               child: CenaImageCache(
//                                   url: ImagesUltils.getImageApiUrl(
//                                       imagesProducts[i].picture),
//                                   fit: BoxFit.fitHeight),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 : const SizedBox(
//                     child: CenaShimmer(),
//                     height: 220,
//                   ),
//             const SizedBox(height: 20.0),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 15.0, vertical: 5.0),
//                     decoration: BoxDecoration(
//                         color: CenaColors.primary,
//                         borderRadius: BorderRadius.circular(5.0)),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.star_rounded,
//                             color: Colors.white, size: 18),
//                         const SizedBox(width: 3.0),
//                         CenaTextDescription(
//                             text: ' ${S.of(context).store_info_rate} 4.9',
//                             color: Colors.white,
//                             fontSize: 17)
//                       ],
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.timer, size: 18),
//                       const SizedBox(width: 5.0),
//                       CenaTextDescription(
//                           text: '30 ${S.of(context).store_order_min}'),
//                     ],
//                   ),
//                   // const CenaTextDescription(text: '\$ Free Shipping')
//                 ],
//               ),
//             ),
//             const SizedBox(height: 30.0),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: CenaTextDescription(
//                   text: widget.product.nameProduct,
//                   fontSize: 30,
//                   fontWeight: FontWeight.w500),
//             ),
//             const SizedBox(height: 10.0),
//             Expanded(
//               flex: 3,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                 child: CenaTextDescription(
//                     text: widget.product.description,
//                     fontSize: 18,
//                     color: Colors.grey,
//                     maxLine: 5),
//               ),
//             ),
//             const SizedBox(height: 20.0),
//             Expanded(
//               flex: 1,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                     height: 90,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           height: 50,
//                           width: 150,
//                           decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               borderRadius: BorderRadius.circular(15.0)),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               IconButton(
//                                   splashColor: Colors.transparent,
//                                   highlightColor: Colors.transparent,
//                                   icon: const Icon(Icons.remove),
//                                   onPressed: () {
//                                     if (currentProduct.quantity > 0) {
//                                       cartBloc.add(
//                                           OnDecreaseProductQuantityEvent(
//                                               currentProduct.uidProduct,
//                                               widget.storeId));
//                                     }
//                                   }),
//                               const SizedBox(width: 10.0),
//                               CenaTextDescription(
//                                   text: currentProduct.quantity.toString(),
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500),
//                               const SizedBox(width: 10.0),
//                               IconButton(
//                                   splashColor: Colors.transparent,
//                                   highlightColor: Colors.transparent,
//                                   icon: const Icon(Icons.add),
//                                   onPressed: () => cartBloc.add(
//                                       OnIncreaseProductQuantityEvent(
//                                           currentProduct.uidProduct,
//                                           widget.storeId))),
//                             ],
//                           ),
//                         ),
//                         (widget.product.status == 1)
//                             ? Container(
//                                 height: 50,
//                                 width: 220,
//                                 decoration: BoxDecoration(
//                                     color: CenaColors.primary,
//                                     borderRadius: BorderRadius.circular(15.0)),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     TextButton(
//                                       child: Row(
//                                         children: [
//                                           CenaTextDescription(
//                                               text: firstCount == "-1" ||
//                                                       firstCount == "0"
//                                                   ? S
//                                                       .of(context)
//                                                       .client_product_detail_add
//                                                   : S
//                                                       .of(context)
//                                                       .client_product_detail_update,
//                                               color: Colors.white,
//                                               fontSize: currentProduct.price *
//                                                           currentProduct
//                                                               .quantity <
//                                                       1000000
//                                                   ? 14
//                                                   : 12),
//                                           CenaTextDescription(
//                                               text:
//                                                   ' ${numberFormat.format((currentProduct.price * currentProduct.quantity).toInt()).toString()} vnđ',
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.w500,
//                                               fontSize: currentProduct.price *
//                                                           currentProduct
//                                                               .quantity <
//                                                       1000000
//                                                   ? 14
//                                                   : 12)
//                                         ],
//                                       ),
//                                       onPressed: () {
//                                         cartBloc.add(OnAddProductToCartEvent(
//                                             currentProduct, widget.storeId));
//                                         Navigator.pop(context);

//                                         // cenaToastSuccess('Product Added');
//                                       },
//                                     ),
//                                     const SizedBox(width: 5.0),
//                                   ],
//                                 ))
//                             : Container(
//                                 height: 50,
//                                 width: 220,
//                                 decoration: BoxDecoration(
//                                     color: Colors.red,
//                                     borderRadius: BorderRadius.circular(15.0)),
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     const Icon(
//                                         Icons.sentiment_dissatisfied_rounded,
//                                         color: Colors.white,
//                                         size: 30),
//                                     const SizedBox(width: 5.0),
//                                     CenaTextDescription(
//                                         text: S
//                                             .of(context)
//                                             .client_product_detail_soldout,
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.w500)
//                                   ],
//                                 ),
//                               )
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       }),
//     );
//   }
// }
