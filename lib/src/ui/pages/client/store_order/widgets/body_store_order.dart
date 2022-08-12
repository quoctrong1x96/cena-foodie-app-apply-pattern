// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// import '../../../../../utils/configs/cena_colors.dart';
// import '../../../../configs/cena_text_styles.dart';
// import '../../../../generated/l10n.dart';
// import '../../../../data/models/entities/store/store.dart';
// import '../../../../widgets/widgets.dart';
// import 'store_image_review.dart';
// import 'tab_bar.dart';

// class Body extends StatelessWidget {
//   final Store store;
//   const Body({Key? key, required this.store}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: ListView(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//           physics: const BouncingScrollPhysics(),
//           children: [
//             StoreImageReview(store),
//             const SizedBox(height: 10),
//             storeName(store, context),
//             ratingStore(store, context),
//             const Divider(),
//             CustomTabs(store: store),
//           ]),
//     );
//   }

//   Widget storeName(Store store, BuildContext context) {
//     final lang = S.of(context);
//     return Container(
//       color: CenaColors.secondary,
//       child: Wrap(
//         direction: Axis.horizontal,
//         alignment: WrapAlignment.start,
//         children: [
//           if (store.address != "")
//             Container(
//                 height: 21,
//                 width: 80,
//                 alignment: Alignment.topCenter,
//                 decoration: const BoxDecoration(
//                     color: CenaColors.primary,
//                     borderRadius: BorderRadius.only(
//                         bottomRight: Radius.circular(5.0),
//                         topRight: Radius.circular(5.0))),
//                 child: Text(
//                   " ${lang.store_order_like} ",
//                   style: CenaTextStyles.whiteS14,
//                 ))
//           else
//             const SizedBox(
//               width: 1,
//             ),
//           const SizedBox(
//             width: 7,
//           ),
//           CenaTextDescription(
//             text: store.storeName!,
//             textAlign: TextAlign.left,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             color: CenaColors.WHITE,
//           ),
//         ],
//       ),
//     );
//   }

//   Padding ratingStore(Store store, BuildContext context) {
//     final lang = S.of(context);
//     return Padding(
//       padding: const EdgeInsets.all(4.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           RatingBar.builder(
//             wrapAlignment: WrapAlignment.start,
//             initialRating: 4.6,
//             ignoreGestures: true,
//             minRating: 0,
//             itemSize: 20,
//             direction: Axis.horizontal,
//             allowHalfRating: true,
//             itemCount: 5,
//             itemPadding: const EdgeInsets.symmetric(horizontal: 0),
//             itemBuilder: (context, _) => const Icon(
//               Icons.star,
//               size: 1.0,
//               color: Colors.amber,
//             ),
//             onRatingUpdate: (rating) {
//               // ignore: avoid_print
//               print(rating);
//             },
//           ),
//           const Text("4.6", style: CenaTextStyles.smallDescription),
//           const Text(
//             " | (",
//             style: CenaTextStyles.smallDescription,
//           ),
//           const Text(
//             "100",
//             style: CenaTextStyles.smallDescription,
//           ),
//           Text(
//             " ${lang.store_order_comments}) ",
//             style: CenaTextStyles.smallDescription,
//           ),
//           const Text(
//             " | ",
//             style: CenaTextStyles.smallDescription,
//           ),
//           const Icon(
//             Icons.lock_clock,
//             color: Colors.grey,
//           ),
//           Text(
//             " ${(double.parse(store.distance!) * 1000 / 500 + 10).toStringAsFixed(0)} ${lang.store_order_min}",
//             style: CenaTextStyles.smallDescription,
//           ),
//         ],
//       ),
//     );
//   }
// }
