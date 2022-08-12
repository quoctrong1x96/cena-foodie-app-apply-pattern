// import 'package:cenafoodie/src/utils/image_ultils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../../../../utils/configs/cena_colors.dart';
// import '../../../controllers/products_controller.dart';
// import '../../../generated/l10n.dart';
// import '../../../models/response/products_top_home_response.dart';
// import '../../../services/url.dart';
// import '../../../widgets/widgets.dart';
// import '../detail_product/details_product_page.dart';

// class SearchForCategoryPage extends StatelessWidget {
//   final int idCategory;
//   final String category;

//   const SearchForCategoryPage(
//       {Key? key, required this.idCategory, required this.category})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: CenaTextDescription(
//             text: category, fontSize: 20, fontWeight: FontWeight.w500),
//         centerTitle: true,
//         elevation: 0,
//         leading: IconButton(
//           icon:
//               const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//         child: FutureBuilder<List<FoodAndDrink>>(
//             future: productController
//                 .searchProductsForCategory(idCategory.toString()),
//             builder: (context, snapshot) => (!snapshot.hasData)
//                 ? const CenaShimmer()
//                 : ListProducts(listProduct: snapshot.data!)),
//       ),
//     );
//   }
// }

// class ListProducts extends StatelessWidget {
//   final List<FoodAndDrink> listProduct;

//   const ListProducts({Key? key, required this.listProduct}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return (listProduct.isNotEmpty)
//         ? StaggeredDualView(
//             spacing: 15,
//             alturaElement: 0.14,
//             aspectRatio: 0.78,
//             itemCount: listProduct.length,
//             itemBuilder: (context, i) => Container(
//                   padding: const EdgeInsets.all(10.0),
//                   decoration: BoxDecoration(
//                       color: Colors.grey[50],
//                       borderRadius: BorderRadius.circular(20.0)),
//                   child: GestureDetector(
//                     onTap: () => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (_) => DetailsProductPage(
//                                   product: listProduct[i],
//                                   storeId: 1,
//                                 ))),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Hero(
//                             tag: listProduct[i].id,
//                             child: CenaImageCache(
//                                 url: ImagesUltils.getImageApiUrl(
//                                     listProduct[i].picture),
//                                 height: 150)),
//                         CenaTextDescription(
//                             text: listProduct[i].nameProduct,
//                             textOverflow: TextOverflow.ellipsis,
//                             fontWeight: FontWeight.w500,
//                             color: CenaColors.primary,
//                             fontSize: 19),
//                         const SizedBox(height: 5.0),
//                         CenaTextDescription(
//                             text: '\$ ${listProduct[i].price.toString()}',
//                             fontSize: 16,
//                             fontWeight: FontWeight.w500)
//                       ],
//                     ),
//                   ),
//                 ))
//         : _withoutProducts(context);
//   }

//   Widget _withoutProducts(BuildContext context) {
//     return Column(
//       children: [
//         SvgPicture.asset('Assets/empty-cart.svg', height: 450),
//         CenaTextDescription(
//             text: S.of(context).client_cart_checkout_without_product,
//             fontSize: 21,
//             color: CenaColors.primary)
//       ],
//     );
//   }
// }
