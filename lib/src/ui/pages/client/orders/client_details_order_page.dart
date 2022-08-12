// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:permission_handler/permission_handler.dart';

// import '../../../../utils/image_ultils.dart';
// import '../../../../utils/configs/cena_colors.dart';
// import '../../../controllers/orders_controller.dart';
// import '../../../controllers/user_controller.dart';
// import '../../../generated/l10n.dart';
// import '../../../helpers/date.dart';
// import '../../../models/pay_type.dart';
// import '../../../models/response/address_one_response.dart';
// import '../../../models/response/order_details_response.dart';
// import '../../../models/response/orders_client_response.dart';
// import '../../../services/url.dart';
// import '../../../ui/blocs/user/user_bloc.dart';
// import '../../../widgets/animation_route.dart';
// import '../../../widgets/widgets.dart';
// import 'client_map_page.dart';

// class ClientDetailsOrderPage extends StatelessWidget {
//   final OrdersClient orderClient;

//   const ClientDetailsOrderPage({Key? key, required this.orderClient})
//       : super(key: key);

//   void accessGps(PermissionStatus status, BuildContext context) {
//     switch (status) {
//       case PermissionStatus.granted:
//         Navigator.pushReplacement(
//             context, routeCena(page: ClientMapPage(orderClient: orderClient)));
//         break;
//       case PermissionStatus.denied:
//       case PermissionStatus.restricted:
//       case PermissionStatus.limited:
//       case PermissionStatus.permanentlyDenied:
//         openAppSettings();
//         break;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
//     final lang = S.of(context);
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: CenaAppbarDefault(
//         centerTitle: true,
//         title: "${lang.client_orders_key} #${orderClient.id}",
//         leading: const CenaButtonDefaultBack(),
//         actions: [
//           Container(
//             alignment: Alignment.center,
//             margin: const EdgeInsets.only(right: 10.0),
//             child: CenaTextDescription(
//               text: Localizations.localeOf(context).toString() == "vi"
//                   ? payTypeVN[payType.indexOf(orderClient.status!)]
//                   : orderClient.status!,
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//               color: CenaColors.WHITE,
//             ),
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               child: FutureBuilder<List<DetailsOrder>?>(
//                   future: ordersController
//                       .getOrderDetailsById(orderClient.id.toString()),
//                   builder: (context, snapshot) => (!snapshot.hasData)
//                       ? Column(
//                           children: const [
//                             CenaShimmer(),
//                             SizedBox(height: 10.0),
//                             CenaShimmer(),
//                             SizedBox(height: 10.0),
//                             CenaShimmer(),
//                           ],
//                         )
//                       : _ListProductsDetails(
//                           listProductDetails: snapshot.data!))),
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CenaTextDescription(
//                         text: lang.client_orders_total,
//                         fontWeight: FontWeight.w500,
//                         color: CenaColors.primary),
//                     CenaTextDescription(
//                         text:
//                             '${numberFormat.format(orderClient.amount).toString()} vnđ',
//                         fontWeight: FontWeight.w500),
//                   ],
//                 ),
//                 const Divider(),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CenaTextDescription(
//                         text: lang.client_orders_shipper,
//                         fontWeight: FontWeight.w500,
//                         color: CenaColors.primary,
//                         fontSize: 17),
//                     Row(
//                       children: [
//                         Container(
//                           height: 35,
//                           width: 35,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: CachedNetworkImageProvider(
//                                       (orderClient.imageDelivery != null)
//                                           ? ImagesUltils.getImageApiUrl(
//                                               orderClient.imageDelivery)
//                                           : ImagesUltils.getImageApiUrl(
//                                               'without-image.jpg')))),
//                         ),
//                         const SizedBox(width: 10.0),
//                         CenaTextDescription(
//                             text: (orderClient.deliveryId != 0)
//                                 ? orderClient.delivery!
//                                 : lang.client_orders_unasignee,
//                             fontSize: 17),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CenaTextDescription(
//                         text: lang.client_orders_date,
//                         fontWeight: FontWeight.w500,
//                         color: CenaColors.primary,
//                         fontSize: 17),
//                     CenaTextDescription(
//                         text: CenaDate.getDateOrder(
//                             orderClient.currentDate.toString()),
//                         fontSize: 16),
//                   ],
//                 ),
//                 const SizedBox(height: 10.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CenaTextDescription(
//                         text: lang.client_orders_address,
//                         fontWeight: FontWeight.w500,
//                         color: CenaColors.primary,
//                         fontSize: 16),
//                     FutureBuilder<Address?>(
//                       future: userController.getAddressById(
//                           BlocProvider.of<UserBloc>(context).state.user!.uid!,
//                           orderClient.addressId!),
//                       builder: (context, snapshot) => (snapshot.hasData)
//                           ? CenaTextDescription(
//                               text: snapshot.data!.addressDetail,
//                               fontSize: 16,
//                               maxLine: 1,
//                               textOverflow: TextOverflow.ellipsis,
//                               textWidth: 292,
//                             )
//                           : const SizedBox(
//                               child: CenaShimmer(),
//                               width: 200.0,
//                             ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20.0),
//               ],
//             ),
//           ),
//           (orderClient.status == 'ON WAY')
//               ? Container(
//                   padding: const EdgeInsets.all(15.0),
//                   child: CenaButton(
//                     text: lang.client_orders_button_follow_shipper,
//                     fontWeight: FontWeight.w500,
//                     onPressed: () async =>
//                         accessGps(await Permission.location.request(), context),
//                   ),
//                 )
//               : Container()
//         ],
//       ),
//     );
//   }
// }

// class _ListProductsDetails extends StatelessWidget {
//   final List<DetailsOrder> listProductDetails;

//   const _ListProductsDetails({required this.listProductDetails});

//   @override
//   Widget build(BuildContext context) {
//     NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
//     return ListView.separated(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0),
//       itemCount: listProductDetails.length,
//       separatorBuilder: (_, index) => const Divider(),
//       itemBuilder: (_, i) => Container(
//         padding: const EdgeInsets.all(10.0),
//         child: Row(
//           children: [
//             Container(
//               height: 45,
//               width: 45,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       image: CachedNetworkImageProvider(
//                           ImagesUltils.getImageApiUrl(
//                               listProductDetails[i].picture)))),
//             ),
//             const SizedBox(width: 15.0),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CenaTextDescription(
//                     text: listProductDetails[i].nameProduct!,
//                     fontWeight: FontWeight.w500),
//                 const SizedBox(height: 5.0),
//                 CenaTextDescription(
//                     text:
//                         '${S.of(context).client_orders_count}: ${listProductDetails[i].quantity}',
//                     color: Colors.grey,
//                     fontSize: 17),
//               ],
//             ),
//             Expanded(
//                 child: Container(
//               alignment: Alignment.centerRight,
//               child: CenaTextDescription(
//                   text:
//                       '${numberFormat.format(listProductDetails[i].total).toString()} vnđ'),
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
