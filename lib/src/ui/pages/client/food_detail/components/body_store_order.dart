// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// import '../../../../configs/cena_text_styles.dart';
// import '../../../../models/response/products_top_home_response.dart';
// import 'comment_row.dart';
// import 'food_image_review.dart';

// class FoodDetailBody extends StatefulWidget {
//   final FoodAndDrink foodAndDrink;
//   final int sale;
//   final int like;
//   final double discount;

//   const FoodDetailBody({
//     Key? key,
//     required this.foodAndDrink,
//     required this.sale,
//     required this.like,
//     required this.discount,
//   }) : super(key: key);

//   @override
//   State<FoodDetailBody> createState() => _FoodDetailBodyState();
// }

// class _FoodDetailBodyState extends State<FoodDetailBody> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height + 250,
//         child: SingleChildScrollView(
//           child: Column(
//             children: <Widget>[
//               FoodImageReview(widget.foodAndDrink.picture),
//               const SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: foodInfo(widget.foodAndDrink, widget.sale, widget.like),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: foodPrice(widget.foodAndDrink, widget.discount),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Column(
//                   children: const [
//                     CommentRow(
//                       avatar: "image-1632700696972.png",
//                       comment:
//                           "Sản phẩm này rất ok, Bạn hãy thử và tận hưởng nó"
//                           "Chúng tôi sẽ rất biết hơn bạn, nếu bạn dùng và mua nó."
//                           "Một sản phẩm có thể nói không gì so sánh được",
//                       name: "Comment dạo",
//                       rating: 5,
//                     ),
//                     CommentRow(
//                       avatar: "image-1632700696972.png",
//                       comment:
//                           "Sản phẩm này rất ok, Bạn hãy thử và tận hưởng nó"
//                           "Chúng tôi sẽ rất biết hơn bạn, nếu bạn dùng và mua nó."
//                           "Một sản phẩm có thể nói không gì so sánh được",
//                       name: "Comment dạo",
//                       rating: 5,
//                     ),
//                     CommentRow(
//                       avatar: "image-1632700696972.png",
//                       comment:
//                           "Sản phẩm này rất ok, Bạn hãy thử và tận hưởng nó"
//                           "Chúng tôi sẽ rất biết hơn bạn, nếu bạn dùng và mua nó."
//                           "Một sản phẩm có thể nói không gì so sánh được",
//                       name: "Comment dạo",
//                       rating: 5,
//                     ),
//                     CommentRow(
//                       avatar: "image-1632700696972.png",
//                       comment:
//                           "Sản phẩm này rất ok, Bạn hãy thử và tận hưởng nó"
//                           "Chúng tôi sẽ rất biết hơn bạn, nếu bạn dùng và mua nó."
//                           "Một sản phẩm có thể nói không gì so sánh được",
//                       name: "Comment dạo",
//                       rating: 5,
//                     ),
//                     CommentRow(
//                       avatar: "image-1632700696972.png",
//                       comment:
//                           "Sản phẩm này rất ok, Bạn hãy thử và tận hưởng nó"
//                           "Chúng tôi sẽ rất biết hơn bạn, nếu bạn dùng và mua nó."
//                           "Một sản phẩm có thể nói không gì so sánh được",
//                       name: "Comment dạo",
//                       rating: 5,
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Row foodPrice(FoodAndDrink food, double discount) {
//     double discountPrice = food.price;
//     NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
//     if (discount > 0) {
//       String discountString = (food.price / 100 * discount).toString();
//       discountString = discountString.substring(0, discountString.length - 2);
//       discountPrice = double.parse(discountString);
//     }
//     return Row(
//       children: [
//         const SizedBox(width: 8),
//         discount > 0
//             ? Text(
//                 numberFormat.format(food.price).toString(),
//                 style: CenaTextStyles.foodPriceDiscount,
//               )
//             : Text(
//                 numberFormat.format(food.price).toString(),
//                 style: CenaTextStyles.foodPriceDiscount,
//               ),
//         const SizedBox(width: 8),
//         discount > 0
//             ? Text(
//                 numberFormat.format(discountPrice).toString(),
//                 style: CenaTextStyles.foodPrice,
//               )
//             : const SizedBox(width: 1),
//         const SizedBox(width: 90),
//         TextButton(
//           onPressed: () {
//             // ignore: avoid_print
//             print("Food Detail: Đã thêm vào giỏ hàng");
//           },
//           child: const Text(
//             "+",
//             style: CenaTextStyles.foodPrice,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget foodInfo(FoodAndDrink food, int sale, int like) {
//     String likeFood =
//         sale.toString() + " đã bán | " + like.toString() + " đã thích";
//     return Wrap(
//       direction: Axis.horizontal,
//       children: [
//         Row(
//           children: [
//             Text(
//               food.nameProduct,
//               style: CenaTextStyles.foodName,
//             )
//           ],
//         ),
//         Text(
//           food.description,
//           style: CenaTextStyles.smallDescription,
//         ),
//         Row(
//           children: [
//             Text(
//               likeFood,
//               style: CenaTextStyles.smallDescription,
//             )
//           ],
//         )
//       ],
//     );
//   }
// }
