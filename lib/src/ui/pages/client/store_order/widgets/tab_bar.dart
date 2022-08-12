// import 'package:flutter/material.dart';

// import '../../../../../utils/configs/cena_colors.dart';
// import '../../../../controllers/products_controller.dart';
// import '../../../../models/response/products_top_home_response.dart';
// import '../../../../data/models/entities/store/store.dart';
// import '../../../../widgets/widgets.dart';
// import 'food_row.dart';

// class CustomTabs extends StatefulWidget {
//   final Store store;
//   const CustomTabs({Key? key, required this.store}) : super(key: key);
//   @override
//   _CustomTabsState createState() => _CustomTabsState();
// }

// class _CustomTabsState extends State<CustomTabs> {
//   late PageController _pageController;
//   late List<FoodAndDrink> _foodAndDrinks;
//   late List<String> _categories;
//   bool _isLoading = true;

//   Future<void> _getProductsOfStore() async {
//     final int _storeId = widget.store.id!;

//     List<FoodAndDrink> cenaProducts =
//         await productController.getProductsTopHome(_storeId);
//     List<String> categories = [];
//     for (var product in cenaProducts) {
//       if (categories.isNotEmpty) {
//         if (categories.firstWhere((element) => element == product.category,
//                 orElse: () => "") ==
//             "") {
//           categories.add(product.category);
//         }
//       } else {
//         categories.add(product.category);
//       }
//     }
//     setState(() {
//       _foodAndDrinks = cenaProducts;
//       _isLoading = false;
//       _categories = categories;
//     });
//   }

//   @override
//   void initState() {
//     _pageController = PageController();
//     super.initState();
//     _getProductsOfStore();
//     setState(() {});
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _isLoading
//         ? Column(
//             children: const [
//               CenaShimmer(),
//               SizedBox(height: 5),
//               CenaShimmer(),
//               SizedBox(height: 5),
//               CenaShimmer()
//             ],
//           )
//         : ListView.builder(
//             itemCount: _categories.length,
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             itemBuilder: (_, i) => Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 10.0),
//                 Container(
//                   color: CenaColors.WHITE,
//                   width: MediaQuery.of(context).size.width,
//                   child: CenaTextGroup(
//                     text: _categories[i],
//                     // color: CenaColors.,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 GridView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   shrinkWrap: true,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 1,
//                       crossAxisSpacing: 5,
//                       mainAxisSpacing: 1,
//                       mainAxisExtent: 100),
//                   itemCount: _foodAndDrinks
//                       .where((element) => _categories[i] == element.category)
//                       .length,
//                   itemBuilder: (_, j) => Container(
//                     decoration: BoxDecoration(
//                         color: CenaColors.WHITE,
//                         borderRadius: BorderRadius.circular(1.0)),
//                     child: GestureDetector(
//                       onTap: () => {},
//                       child: FoodRow(
//                         foodAndDrink: _foodAndDrinks
//                             .where(
//                                 (element) => _categories[i] == element.category)
//                             .elementAt(j),
//                         storeId: widget.store.id!,
//                         discount: 10,
//                         like: 100,
//                         sale: 10,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }
// }

// class TabButton extends StatelessWidget {
//   final String text;
//   final int selectedPage;
//   final int pageNumber;
//   final VoidCallback onPressed;
//   const TabButton(
//       {Key? key,
//       required this.text,
//       required this.selectedPage,
//       required this.pageNumber,
//       required this.onPressed})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         curve: Curves.easeIn,
//         decoration: BoxDecoration(
//           // color:
//           //     selectedPage == pageNumber ? kPrimaryColor : Colors.transparent,
//           border: selectedPage == pageNumber
//               ? const Border(
//                   bottom: BorderSide(color: CenaColors.primary),
//                 )
//               : null,
//         ),
//         padding: EdgeInsets.symmetric(
//           vertical: selectedPage == pageNumber ? 10 : 0,
//           horizontal: selectedPage == pageNumber ? 16 : 0,
//         ),
//         margin: EdgeInsets.symmetric(
//           vertical: selectedPage == pageNumber ? 0 : 10,
//           horizontal: selectedPage == pageNumber ? 0 : 16,
//         ),
//         child: Text(
//           text,
//           style: TextStyle(
//             color:
//                 selectedPage == pageNumber ? CenaColors.primary : Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }
