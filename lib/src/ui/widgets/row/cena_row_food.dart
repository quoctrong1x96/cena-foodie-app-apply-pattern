// import 'package:cenafoodie/utils/configs/cena_colors.dart';
// import 'package:cenafoodie/configs/cena_text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:intl/intl.dart';

// class CenaFoodRow extends StatelessWidget {
//   final 
//   final int? sale;
//   final int? like;
//   final int? discount;

//   const CenaFoodRow({
//     Key? key,
//     this.image,
//     required this.storeId,
//     required this.productId,
//     this.productName = "Không tên",
//     this.like = 200,
//     this.discount = 20,
//     this.price = 50000,
//     this.sale = 999,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     int discountPrice = price;
//     NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
//     if (discount! > 0) {
//       String discountString = (price / 100 * discount!).toString();
//       discountString = discountString.substring(0, discountString.length - 2);
//       discountPrice = int.parse(discountString);
//     }
//     return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//         child: GestureDetector(
//           onTap: () {
//             // Navigator.pushNamed(context, FoodDetailScreen.routeName);
//           },
//           child: SizedBox(
//             height: 100,
//             // width: double.infinity,
//             child: Row(
//               children: <Widget>[
//                 Image.asset(
//                   image!.toString(),
//                   fit: BoxFit.cover,
//                   height: 100,
//                   width: 100,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 25,
//                       child: Row(
//                         children: <Widget>[
//                           Padding(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 10,
//                             ),
//                             child: Text(
//                               productName!,
//                               textAlign: TextAlign.left,
//                               style: const TextStyle(
//                                   color: Colors.black,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 14.0),
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 25,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                         ),
//                         child: Row(
//                           children: [
//                             Text(
//                               sale.toString(),
//                               textAlign: TextAlign.left,
//                               style: CenaTextStyles.blackS12,
//                             ),
//                             Text(
//                               " đã bán | ",
//                               style: CenaTextStyles.blackS12,
//                             ),
//                             Text(
//                               like.toString() + " thích ",
//                               textAlign: TextAlign.left,
//                               style: CenaTextStyles.blackS12,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     SizedBox(
//                       width: MediaQuery.of(context).size.width - 120,
//                       height: 25,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 10,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             discount! > 0
//                                 ? Text(
//                                     numberFormat.format(price).toString(),
//                                     overflow: TextOverflow.ellipsis,
//                                     style: CenaTextStyles.tintS12,
//                                   )
//                                 : Text(
//                                     numberFormat.format(price).toString(),
//                                     overflow: TextOverflow.ellipsis,
//                                     style: CenaTextStyles.blackS12,
//                                   ),
//                             discount! > 0
//                                 ? Text(
//                                     numberFormat
//                                         .format(discountPrice)
//                                         .toString(),
//                                     overflow: TextOverflow.ellipsis,
//                                     style: CenaTextStyles.tintS12,
//                                   )
//                                 : const SizedBox(),
//                             Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                     width: 1,
//                                     style: BorderStyle.solid,
//                                     color: CenaColors.primary),
//                                 borderRadius: const BorderRadius.all(
//                                     Radius.circular(
//                                         5.0) //                 <--- border radius here
//                                     ),
//                               ),
//                               child: TextButton(
//                                 onPressed: () => _onPressAddToCart(context),
//                                 child: Text(
//                                   "+",
//                                   style: CenaTextStyles.tintS12,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }

//   void _onPressAddToCart(BuildContext context) {
//     int discountPrice = price;
//     NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
//     if (discount! > 0) {
//       String discountString = (price / 100 * discount!).toString();
//       discountString = discountString.substring(0, discountString.length - 2);
//       discountPrice = int.parse(discountString);
//     }
//     if (discount! > 0) {
//       // List<Map<String, dynamic>> _radioButtonText = <Map<String, dynamic>>[
//       //   <String, dynamic>{"name": "Ít đá", "index": 1},
//       //   <String, dynamic>{"name": "Đá bình thường", "index": 2},
//       //   <String, dynamic>{"name": "Nhiều đá", "index": 3},
//       // ];
//       showModalBottomSheet<dynamic>(
//           isScrollControlled: true,
//           context: context,
//           builder: (context) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               mainAxisSize: MainAxisSize.max,
//               children: [
//                 Text('Thêm món mới', style: CenaTextStyles.blackS12),
//                 const Divider(),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Row(
//                     children: <Widget>[
//                       Image.asset(
//                         image!.toString(),
//                         fit: BoxFit.cover,
//                         height: 90,
//                         width: 90,
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(
//                             height: 25,
//                             child: Row(
//                               children: <Widget>[
//                                 Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                     horizontal: 10,
//                                   ),
//                                   child: Text(
//                                     productName!,
//                                     textAlign: TextAlign.left,
//                                     style: const TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 14.0),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 25,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 10,
//                               ),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     sale.toString(),
//                                     textAlign: TextAlign.left,
//                                     style: CenaTextStyles.blackS12,
//                                   ),
//                                   Text(
//                                     " đã bán | ",
//                                     style: CenaTextStyles.blackS12,
//                                   ),
//                                   Text(
//                                     like.toString() + " thích ",
//                                     textAlign: TextAlign.left,
//                                     style: CenaTextStyles.blackS12,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           const SizedBox(height: 15),
//                           SizedBox(
//                             width: MediaQuery.of(context).size.width - 180,
//                             height: 25,
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 horizontal: 10,
//                               ),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: <Widget>[
//                                   discount! > 0
//                                       ? Text(
//                                           numberFormat.format(price).toString(),
//                                           overflow: TextOverflow.ellipsis,
//                                           style: CenaTextStyles.tintS12,
//                                         )
//                                       : Text(
//                                           numberFormat.format(price).toString(),
//                                           overflow: TextOverflow.ellipsis,
//                                           style: CenaTextStyles.tintS12,
//                                         ),
//                                   discount! > 0
//                                       ? Text(
//                                           numberFormat
//                                               .format(discountPrice)
//                                               .toString(),
//                                           overflow: TextOverflow.ellipsis,
//                                           style: CenaTextStyles.tintS12,
//                                         )
//                                       : const SizedBox(),
//                                   Container(
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           width: 1,
//                                           style: BorderStyle.solid,
//                                           color: CenaColors.primary),
//                                       borderRadius: const BorderRadius.all(
//                                           Radius.circular(
//                                               5.0) //                 <--- border radius here
//                                           ),
//                                     ),
//                                     child: TextButton(
//                                       onPressed: () {
//                                         // ignore: avoid_print
//                                         print("Add to cart");
//                                       },
//                                       child: Text(
//                                         "+",
//                                         style: CenaTextStyles.tintS12,
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const Divider(),
//                 const SizedBox(
//                   child: Text(
//                     "Chọn đá",
//                     style: CenaTextStyles.foodName,
//                   ),
//                 ),
//                 const Divider(),
//                 Expanded(child: RadioGroup(listRadio: radioGroupIce)),
//                 // Divider(),
//                 // SizedBox(
//                 //   child: Text("Chọn mức đường", style: CenaTextStyles.foodName),
//                 // ),
//                 // Divider(),
//                 // Expanded(child: RadioGroup(listRadio: radioGroupSugar)),
//                 const Divider(),
//                 Column(
//                   children: const [],
//                 ),
//                 const Divider(),
//                 const SizedBox(
//                   child: Text("Chọn thạnh pudding",
//                       style: CenaTextStyles.foodName),
//                 ),
//                 const Expanded(child: DynamicallyCheckbox()),
//                 SizedBox(
//                   width: double.infinity,
//                   child: Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     child: TextButton(
//                       child: const Text(
//                         "Thêm vào giỏ hàng",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 14,
//                         ),
//                       ),
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       style: ButtonStyle(
//                         backgroundColor:
//                             MaterialStateProperty.resolveWith<Color>(
//                           (Set<MaterialState> states) {
//                             if (states.contains(MaterialState.pressed)) {
//                               return Theme.of(context)
//                                   .colorScheme
//                                   .primary
//                                   .withOpacity(0.5);
//                             }
//                             return CenaColors
//                                 .primary; // Use the component's default.
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             );
//           });
//     }
//   }
// }

// class DynamicallyCheckbox extends StatefulWidget {
//   const DynamicallyCheckbox({Key? key}) : super(key: key);

//   @override
//   DynamicallyCheckboxState createState() => DynamicallyCheckboxState();
// }

// class DynamicallyCheckboxState extends State {
//   Map<String, bool> list = {
//     'Thạnh dừa': false,
//     'Sương sáo': false,
//     'Trân châu trắng': false,
//     'Bánh Flan': false,
//     'Thạch cà phê': false,
//   };

//   var holder_1 = <dynamic>[];

//   void getItems() {
//     list.forEach((key, value) {
//       if (value == true) {
//         holder_1.add(key);
//       }
//     });
//     holder_1.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: <Widget>[
//       Expanded(
//         child: ListView(
//           children: list.keys.map((String key) {
//             return CheckboxListTile(
//               title: Text(key),
//               value: list[key],
//               activeColor: Colors.deepPurple[400],
//               checkColor: Colors.white,
//               onChanged: (bool? value) {
//                 setState(() {
//                   list[key] = value!;
//                 });
//               },
//             );
//           }).toList(),
//         ),
//       ),
//     ]);
//   }
// }

// class CategoryCard extends StatelessWidget {
//   const CategoryCard({
//     Key? key,
//     required this.icon,
//     required this.text,
//     required this.press,
//   }) : super(key: key);

//   final String? icon, text;
//   final GestureTapCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           onTap: press,
//           child: SizedBox(
//             width: 90,
//             child: Column(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.all(10),
//                   height: 50,
//                   width: 50,
//                   decoration: BoxDecoration(
//                     //color: kPrimaryLightColor,
//                     borderRadius: BorderRadius.circular(10),
//                     border: Border.all(
//                       color: CenaColors.DARK,
//                       width: 1,
//                     ),
//                   ),
//                   child: SvgPicture.asset(
//                     icon!,
//                     color: CenaColors.primary,
//                     height: 30,
//                     width: 30,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   text!,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(fontSize: 12.0),
//                 )
//               ],
//             ),
//           ),
//         ),
//         const SizedBox(height: 10),
//         SizedBox(
//           width: 90,
//           child: Column(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(10),
//                 height: 50,
//                 width: 50,
//                 decoration: BoxDecoration(
//                   //color: kPrimaryLightColor,
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(
//                     color: CenaColors.DARK,
//                     width: 1,
//                   ),
//                 ),
//                 child: SvgPicture.asset(
//                   icon!,
//                   color: CenaColors.primary,
//                   height: 30,
//                   width: 30,
//                 ),
//               ),
//               const SizedBox(height: 5),
//               Text(
//                 text!,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(fontSize: 12.0),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

// // ignore: must_be_immutable
// class RadioGroup extends StatefulWidget {
//   RadioGroup({Key? key, required this.listRadio}) : super(key: key);
//   List<FruitsList> listRadio;
//   @override
//   RadioGroupWidget createState() => RadioGroupWidget();
// }

// class FruitsList {
//   String name;
//   int index;
//   FruitsList({required this.name, required this.index});
// }

// List<FruitsList> radioGroupSugar = [
//   FruitsList(
//     index: 1,
//     name: "Ít đường",
//   ),
//   FruitsList(
//     index: 2,
//     name: "Đường bình thường",
//   ),
//   FruitsList(
//     index: 3,
//     name: "Nhiều đường",
//   ),
// ];

// List<FruitsList> radioGroupIce = [
//   FruitsList(
//     index: 1,
//     name: "Đá chung",
//   ),
//   FruitsList(
//     index: 2,
//     name: "Đá riêng",
//   ),
//   // FruitsList(
//   //   index: 3,
//   //   name: "Nhiều đá",
//   // ),
// ];

// class RadioGroupWidget extends State<RadioGroup> {
//   // Default Radio Button Item
//   String radioItem = 'Ít đá';

//   // Group Value for Radio Button.
//   int id = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Expanded(
//             child: SizedBox(
//           height: 350.0,
//           child: Column(
//             children: widget.listRadio
//                 .map((data) => RadioListTile(
//                       title: Text(data.name),
//                       groupValue: id,
//                       value: data.index,
//                       onChanged: (val) {
//                         setState(() {
//                           radioItem = data.name;
//                           id = data.index;
//                         });
//                       },
//                     ))
//                 .toList(),
//           ),
//         )),
//       ],
//     );
//   }
// }
