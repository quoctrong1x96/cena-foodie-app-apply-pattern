// import 'package:flutter/material.dart';

// import '../../../../data/models/entities/store/store.dart';
// import 'imges_review.dart';

// class StoreImageReview extends StatefulWidget {
//   final Store store;
//   const StoreImageReview(this.store, {Key? key}) : super(key: key);

//   @override
//   _StoreImageReview createState() => _StoreImageReview();
// }

// class _StoreImageReview extends State<StoreImageReview> {
//   int currentPage = 0;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 250,
//             child: PageView.builder(
//               onPageChanged: (value) {
//                 setState(() {
//                   currentPage = value;
//                 });
//               },
//               itemCount: 1,
//               itemBuilder: (context, index) => ImageReview(
//                 image: widget.store.image!,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
