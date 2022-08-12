// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cenafoodie/src/screens/client/store_order/store_order.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../data/models/entities/address/address.dart';
// import '../../data/models/entities/store/store.dart';
// import '../../../ui/blocs/auth/auth_bloc.dart';
// import '../../blocs/client_store/client_store_bloc.dart';
// import '../..//ui/blocs/user/user_bloc.dart';
// import '../../../utils/configs/cena_colors.dart';
// import '../../controllers/store_controller.dart';
// import '../../resources/generated/l10n.dart';
// import '../../helpers/Date.dart';
// import '../../services/url.dart';
// import '../../widgets/animation_route.dart';
// import '../../widgets/cena_bottom_avigation.dart';
// import '../../widgets/row/cena_row_store.dart';
// import '../../widgets/widgets.dart';
// import '../profile/list_addresses_page.dart';

// class ClientHomePage extends StatefulWidget {
//   const ClientHomePage({Key? key}) : super(key: key);

//   @override
//   State<ClientHomePage> createState() => _ClientHomePageState();
// }

// class _ClientHomePageState extends State<ClientHomePage>
//     with TickerProviderStateMixin {
//   final ScrollController _scrollController = ScrollController();
//   List<Store> stores = [];
//   bool _isLoading = false, _allLoaded = false;
//   final int storesPerLoading = 7;

//   int whatIsPaginationOf(List<Store> stores) {
//     if (stores.isEmpty) {
//       return 0;
//     } else {
//       return ((stores.length + 1) / storesPerLoading).round();
//     }
//   }

//   Future<void> storeFetchPerPage() async {
//     final Address? address = BlocProvider.of<UserBloc>(context).state.address;
//     if (_allLoaded) {
//       return;
//     }
//     if (mounted) {
//       setState(() {
//         _isLoading = true;
//       });
//     }

//     List<Store> list = await storeController.getAllStoreByPage(
//         whatIsPaginationOf(stores) * storesPerLoading,
//         storesPerLoading,
//         address!.latitude!,
//         address.longitude!);
//     await Future.delayed(const Duration(milliseconds: 500));
//     if (list.isNotEmpty) {
//       for (var store in list) {
//         stores.add(store);
//       }
//     }
//     if (mounted) {
//       setState(() {
//         _isLoading = false;
//         _allLoaded = list.isEmpty;
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     storeFetchPerPage();
//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels >=
//               _scrollController.position.maxScrollExtent &&
//           !_isLoading) {
//         storeFetchPerPage();
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   Future<bool> _onWillPop(BuildContext context) async {
//     bool? exitResult = await _showExitBottomSheet(context);
//     return exitResult ?? false;
//   }

//   Future<bool?> _showExitBottomSheet(BuildContext context) async {
//     return await showModalBottomSheet(
//       backgroundColor: Colors.transparent,
//       context: context,
//       builder: (BuildContext context) {
//         return Container(
//           padding: const EdgeInsets.all(16),
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(24),
//               topRight: Radius.circular(24),
//             ),
//           ),
//           child: _buildBottomSheet(context),
//         );
//       },
//     );
//   }

//   Widget _buildBottomSheet(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         const SizedBox(
//           height: 24,
//         ),
//         CenaTextDescription(
//           text: S.of(context).admin_confirm_exit,
//           fontSize: 16,
//         ),
//         const SizedBox(
//           height: 24,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             TextButton(
//               style: ButtonStyle(
//                 padding: MaterialStateProperty.all(
//                   const EdgeInsets.symmetric(
//                     horizontal: 8,
//                   ),
//                 ),
//               ),
//               onPressed: () => Navigator.of(context).pop(false),
//               child: CenaTextDescription(
//                 text: S.of(context).admin_confirm_no,
//                 fontSize: 16,
//                 color: CenaColors.primary,
//               ),
//             ),
//             TextButton(
//               style: ButtonStyle(
//                 padding: MaterialStateProperty.all(
//                   const EdgeInsets.symmetric(
//                     horizontal: 8,
//                   ),
//                 ),
//               ),
//               onPressed: () => Navigator.of(context).pop(true),
//               child: CenaTextDescription(
//                 text: S.of(context).admin_confirm_yes,
//                 fontSize: 16,
//                 color: CenaColors.GREY,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final authBloc = BlocProvider.of<AuthBloc>(context);
//     final lang = S.of(context);

//     return WillPopScope(
//       onWillPop: () => _onWillPop(context),
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//           child: ListView(
//             controller: _scrollController,
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             physics: const BouncingScrollPhysics(),
//             children: [
//               const SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                         height: 45,
//                         width: 45,
//                         decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             image: DecorationImage(
//                                 fit: BoxFit.cover,
//                                 image: CachedNetworkImageProvider(URLS
//                                         .BASE_URL +
//                                     authBloc.state.user!.image.toString()))),
//                       ),
//                       const SizedBox(width: 8.0),
//                       CenaTextDescription(
//                           text: CenaDate.getDateCena(context) +
//                               ', ${authBloc.state.user!.lastName!.toUpperCase()}',
//                           fontSize: 17,
//                           color: CenaColors.secondary),
//                     ],
//                   ),
//                   // InkWell(
//                   //   onTap: () => Navigator.pushReplacement(
//                   //       context, routeCena(page: const CartClientPage())),
//                   //   child: Stack(
//                   //     children: [
//                   //       const Icon(Icons.shopping_bag_outlined, size: 30),
//                   //       Positioned(
//                   //         right: 0,
//                   //         bottom: 5,
//                   //         child: Container(
//                   //             height: 20,
//                   //             width: 15,
//                   //             decoration: const BoxDecoration(
//                   //                 color: Color(0xff0C6CF2),
//                   //                 shape: BoxShape.circle),
//                   //             child: Center(
//                   //                 child: BlocBuilder<CartBloc, CartState>(
//                   //                     builder: (context, state) =>
//                   //                         CenaTextDescription(
//                   //                             text: state.quantityCart.toString(),
//                   //                             color: Colors.white,
//                   //                             fontWeight: FontWeight.bold,
//                   //                             fontSize: 15)))),
//                   //       ),
//                   //     ],
//                   //   ),
//                   // )
//                 ],
//               ),
//               const SizedBox(height: 20.0),
//               Container(
//                   padding: const EdgeInsets.only(right: 50.0),
//                   child: CenaTextDescription(
//                       text: lang.client_home_question,
//                       fontSize: 28,
//                       maxLine: 2,
//                       fontWeight: FontWeight.w500)),
//               const SizedBox(height: 20.0),
//               GestureDetector(
//                 onTap: () => Navigator.push(
//                     context,
//                     routeCena(
//                         page: const ListAddressesPage(
//                       isSelectAddress: true,
//                     ))),
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 60,
//                       width: 60,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: Colors.grey[300]!),
//                           borderRadius: BorderRadius.circular(15.0)),
//                       child: const Icon(Icons.place_outlined,
//                           size: 38, color: CenaColors.primary),
//                     ),
//                     const SizedBox(width: 10.0),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         CenaTextDescription(
//                             text: lang.client_home_address_title),
//                         BlocBuilder<UserBloc, UserState>(
//                           builder: (context, state) => CenaTextDescription(
//                             text: (state.address != null)
//                                 ? state.address!.detail!
//                                 : lang.client_home_without_address,
//                             color: CenaColors.primary,
//                             fontSize: 17,
//                             textOverflow: TextOverflow.ellipsis,
//                             textWidth: 250,
//                             maxLine: 1,
//                           ),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20.0),
//               // FutureBuilder<List<Category>>(
//               //   future: categoryController.getAllCategories(0),
//               //   builder: (context, snapshot) {
//               //     final List<Category>? category = snapshot.data;

//               //     return !snapshot.hasData
//               //         ? const CenaShimmer()
//               //         : SizedBox(
//               //             height: 45,
//               //             child: ListView.builder(
//               //               physics: const BouncingScrollPhysics(),
//               //               scrollDirection: Axis.horizontal,
//               //               itemCount: category!.length,
//               //               itemBuilder: (context, i) => InkWell(
//               //                 splashColor: Colors.transparent,
//               //                 highlightColor: Colors.transparent,
//               //                 onTap: () => Navigator.push(
//               //                     context,
//               //                     routeCena(
//               //                         page: SearchForCategoryPage(
//               //                             idCategory: category[i].id,
//               //                             category: category[i].category))),
//               //                 child: Container(
//               //                   alignment: Alignment.center,
//               //                   margin: const EdgeInsets.only(right: 10.0),
//               //                   padding:
//               //                       const EdgeInsets.symmetric(horizontal: 20.0),
//               //                   decoration: BoxDecoration(
//               //                       color:
//               //                           const Color(0xff5469D4).withOpacity(.1),
//               //                       borderRadius: BorderRadius.circular(25.0)),
//               //                   child: CenaTextDescription(
//               //                       text: category[i].category),
//               //                 ),
//               //               ),
//               //             ),
//               //           );
//               //   },
//               // ),
//               const SizedBox(height: 20.0),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CenaTextDescription(
//                       text: lang.client_home_store_near_you,
//                       fontSize: 21,
//                       fontWeight: FontWeight.w500),
//                 ],
//               ),
//               const SizedBox(height: 20.0),
//               _buildListStore(),
//               const SizedBox(height: 20.0),
//             ],
//           ),
//         ),
//         bottomNavigationBar: const BottomNavigationCena(0),
//       ),
//     );
//   }

//   Widget _buildListStore() {
//     return LayoutBuilder(builder: (context, constraints) {
//       if (stores.isEmpty) {
//         return Column(
//           children: const [
//             CenaRowStoreShimmer(),
//             SizedBox(height: 10.0),
//             CenaRowStoreShimmer(),
//             SizedBox(height: 10.0),
//             CenaRowStoreShimmer(),
//             SizedBox(height: 10.0),
//             CenaRowStoreShimmer(),
//           ],
//         );
//       } else {
//         final clientStoreBloc = BlocProvider.of<ClientStoreBloc>(context);
//         return Stack(children: [
//           GridView.builder(
//               physics: const NeverScrollableScrollPhysics(),
//               shrinkWrap: true,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 1,
//                   crossAxisSpacing: 0,
//                   mainAxisSpacing: 0,
//                   mainAxisExtent: 100),
//               itemCount: stores.length + (_allLoaded ? 1 : 0),
//               itemBuilder: (_, i) {
//                 if (i < stores.length) {
//                   return Container(
//                       decoration: BoxDecoration(
//                         color: CenaColors.DARK,
//                       ),
//                       child: CenaRowStore(
//                         storeId: stores[i].id!,
//                         name: stores[i].storeName!,
//                         image: stores[i].image,
//                         rating: 4.5,
//                         space: double.parse(double.parse((stores[i].distance!))
//                             .toStringAsFixed(2)),
//                         time: 15,
//                         voucher: "Store mới giảm 30%",
//                         categories: stores[i].categories!,
//                         onTab: () {
//                           clientStoreBloc.add(OnOpenStoreEvent(stores[i]));
//                           Navigator.push(context,
//                               routeCena(page: StoreOrderPage(stores[i])));
//                         },
//                       )

//                       // GestureDetector(
//                       //   onTap: () => {
//                       //     //  Navigator.push(
//                       //     //       context,
//                       //     //       MaterialPageRoute(
//                       //     //           builder: (_) =>
//                       //     //               DetailsProductPage(product: listProduct![i])))
//                       //   },
//                       //   child: Column(
//                       //     mainAxisAlignment: MainAxisAlignment.center,
//                       //     children: [
//                       //       Hero(
//                       //           tag: stores![i].id!,
//                       //           child: CenaImageCache(url:
//                       //               ImagesUltils.get(stores[i].image),
//                       //               height: 150)),
//                       //       CenaTextDescription(
//                       //           text: stores[i].storeName!,
//                       //           textOverflow: TextOverflow.ellipsis,
//                       //           fontWeight: FontWeight.w500,
//                       //           color: CenaColors.primary,
//                       //           fontSize: 19),
//                       //       const SizedBox(height: 5.0),
//                       //       const CenaTextDescription(
//                       //           text: '100.000 vnđ',
//                       //           fontSize: 16,
//                       //           fontWeight: FontWeight.w500)
//                       //     ],
//                       //   ),
//                       // ),
//                       );
//                 } else {
//                   return SizedBox(
//                     width: constraints.maxWidth,
//                     height: 50,
//                     child: const Center(
//                       child: CenaTextDescription(text: "Nothing more to load!"),
//                     ),
//                   );
//                 }
//               }),
//           if (_isLoading) ...[
//             Positioned(
//                 bottom: 0,
//                 left: 0,
//                 child: SizedBox(
//                   width: constraints.maxWidth,
//                   height: 80,
//                   child: const Center(child: CircularProgressIndicator()),
//                 ))
//           ]
//         ]);
//       }
//     });
//   }
// }
