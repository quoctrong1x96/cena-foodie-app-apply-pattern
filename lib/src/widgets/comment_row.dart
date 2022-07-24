// import 'package:flutter/material.dart';
// import 'package:cenafoodie/config/app_colors.dart';
// import 'package:cenafoodie/config/app_text_styles.dart';
// import 'package:cenafoodie/model/entities/comment/comment_entity.dart';

// class CommentRow extends StatelessWidget {
//   final CommentEntity comment;

//   const CommentRow(this.comment);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//         child: SizedBox(
//           width: double.maxFinite,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               SizedBox(
//                 height: 20,
//                 width: 20,
//                 child: CircleAvatar(
//                   backgroundImage: AssetImage(comment.userAvatar),
//                 ),
//               ),
//               SizedBox(
//                 width: double.maxFinite,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       " " + comment.userName,
//                       style: AppTextStyle.greyS14,
//                     ),
//                     Row(
//                       children: <Widget>[
//                         SizedBox(width: 5),
//                         //  RatingBar.builder(
//                         //   wrapAlignment: WrapAlignment.start,
//                         //   initialRating: rating,
//                         //   ignoreGestures: true,
//                         //   minRating: 1,
//                         //   itemSize: getProportionateScreenWidth(15),
//                         //   direction: Axis.horizontal,
//                         //   allowHalfRating: true,
//                         //   itemCount: 5,
//                         //   itemPadding: EdgeInsets.symmetric(
//                         //       horizontal: getProportionateScreenWidth(0)),
//                         //   itemBuilder: (context, _) => const Icon(
//                         //     Icons.star,
//                         //     size: 1.0,
//                         //     color: Colors.amber,
//                         //   ),
//                         //   onRatingUpdate: (rating) {
//                         //     // ignore: avoid_print
//                         //     print(rating);
//                         //   },
//                         // ),
//                       ],
//                     ),
//                     Wrap(
//                       direction: Axis.horizontal,
//                       children: [
//                         Text(
//                           comment.content,
//                           style: AppTextStyle.greyS14,
//                         )
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     Text(DateTime.now().toString(),
//                         style: AppTextStyle.greyS14),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ));
//   }

//   Widget storeName() {
//     return Wrap(
//       direction: Axis.horizontal,
//       children: [
//         Container(
//           width: 60,
//           alignment: Alignment.topLeft,
//           decoration: BoxDecoration(color: AppColors.GREEN),
//           child: Text(
//             " Yêu thích ",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 11.0,
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 7,
//         ),
//         Text(
//           " Bánh Mỳ Huỳnh Hoa - Bánh Mì Pate - Bánh mì xông khói",
//           textAlign: TextAlign.left,
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 16.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ],
//     );
//   }
// }
