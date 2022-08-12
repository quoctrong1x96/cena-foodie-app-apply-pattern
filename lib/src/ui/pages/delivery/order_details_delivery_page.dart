// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:permission_handler/permission_handler.dart';

// import '../../../data/models/entities/order/order.dart';
// import '../../../utils/../utils/helpers/helpers.dart';
// import '../../../utils/image_ultils.dart';
// import '../../blocs/my_location/my_location_map_bloc.dart';
// import '../../blocs/order/orders_bloc.dart';
// import '../../resources/generated/l10n.dart';
// import '../../widgets/animation_route.dart';
// import '../../widgets/snackbars/cena_snackbar_toast.dart';
// import '../../widgets/widgets.dart';
// import 'map_delivery_page.dart';

// class OrdersDetailsDeliveryPage extends StatefulWidget {
//   final Order order;

//   const OrdersDetailsDeliveryPage({Key? key, required this.order})
//       : super(key: key);

//   @override
//   _OrdersDetailsDeliveryPageState createState() =>
//       _OrdersDetailsDeliveryPageState();
// }

// class _OrdersDetailsDeliveryPageState extends State<OrdersDetailsDeliveryPage> {
//   late MyLocationMapBloc mylocationmapBloc;

//   Future<void> _getPermistion() async {
//     accessGps(await Permission.location.request(), context);
//   }

//   @override
//   void initState() {
//     _getPermistion();
//     mylocationmapBloc = BlocProvider.of<MyLocationMapBloc>(context);
//     mylocationmapBloc.initialLocation();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     mylocationmapBloc.cancelLocation();
//     super.dispose();
//   }

//   void accessGps(PermissionStatus status, BuildContext context) {
//     switch (status) {
//       case PermissionStatus.granted:
//         Navigator.pushReplacement(
//             context, routeCena(page: MapDeliveryPage(order: widget.order)));
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
//     final orderBloc = BlocProvider.of<OrdersBloc>(context);
//     final NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
//     final lang = S.of(context);
//     return BlocListener<OrdersBloc, OrdersState>(
//       listener: (context, state) {
//         if (state is LoadingOrderState) {
//           modalLoading(context);
//         } else if (state is SuccessOrdersState) {
//           Navigator.pop(context);
//           cenaToastSuccess(lang.delivery_detail_success);
//           () async => accessGps(await Permission.location.request(), context);
//         } else if (state is FailureOrdersState) {
//           Navigator.pop(context);
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//               content:
//                   CenaTextDescription(text: state.error, color: Colors.white),
//               backgroundColor: Colors.red));
//         }
//       },
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         appBar: CenaAppbarDefault(
//             title: '${lang.delivery_detail_order_id} #${widget.order.id}',
//             leading: const CenaButtonDefaultBack()),
//         body: Column(
//           children: [
//             Expanded(
//                 flex: 2,
//                 child: FutureBuilder<List<DetailsOrder>?>(
//                     future: ordersController
//                         .getOrderDetailsById(widget.order.orderId.toString()),
//                     builder: (context, snapshot) => (!snapshot.hasData)
//                         ? Column(
//                             children: const [
//                               CenaShimmer(),
//                               SizedBox(height: 10.0),
//                               CenaShimmer(),
//                               SizedBox(height: 10.0),
//                               CenaShimmer(),
//                             ],
//                           )
//                         : _ListProductsDetails(
//                             listProductDetails: snapshot.data!))),
//             Container(
//               padding: const EdgeInsets.all(10.0),
//               width: MediaQuery.of(context).size.width,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CenaTextDescription(
//                           text: lang.delivery_detail_title_total,
//                           color: CenaColors.primary,
//                           fontSize: 18,
//                           fontWeight: FontWeight.w500),
//                       CenaTextDescription(
//                           text:
//                               '${numberFormat.format(widget.order.amount)} vnđ',
//                           fontSize: 22,
//                           fontWeight: FontWeight.w500),
//                     ],
//                   ),
//                   const SizedBox(height: 10.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CenaTextDescription(
//                           text: lang.delivery_detail_title_payment,
//                           color: CenaColors.primary,
//                           fontSize: 17,
//                           fontWeight: FontWeight.w500),
//                       CenaTextDescription(
//                           text:
//                               Localizations.localeOf(context).toString() == "vi"
//                                   ? listTypePaymentVN[listTypePayment
//                                       .indexOf(widget.order.payType!)]
//                                   : widget.order.payType!,
//                           fontSize: 16),
//                     ],
//                   ),
//                   const Divider(),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CenaTextDescription(
//                           text: lang.delivery_detail_title_receiver,
//                           color: CenaColors.primary,
//                           fontSize: 17,
//                           fontWeight: FontWeight.w500),
//                       Row(
//                         children: [
//                           Container(
//                             height: 35,
//                             width: 35,
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 image: DecorationImage(
//                                     image: CachedNetworkImageProvider(
//                                         (widget.order.clientImage != null)
//                                             ? ImagesUltils.getImageApiUrl(
//                                                 widget.order.clientImage)
//                                             : ImagesUltils.getImageApiUrl(
//                                                 'without-image.png')))),
//                           ),
//                           const SizedBox(width: 10.0),
//                           CenaTextDescription(text: '${widget.order.client}'),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CenaTextDescription(
//                           text: lang.delivery_detail_title_date,
//                           color: CenaColors.primary,
//                           fontSize: 17,
//                           fontWeight: FontWeight.w500),
//                       CenaTextDescription(
//                           text: CenaDate.getDateOrder(
//                               widget.order.currentDate.toString()),
//                           fontSize: 16),
//                     ],
//                   ),
//                   const SizedBox(height: 10.0),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       CenaTextDescription(
//                           text: lang.delivery_detail_title_address,
//                           color: CenaColors.primary,
//                           fontSize: 17,
//                           fontWeight: FontWeight.w500),
//                       CenaTextDescription(
//                           text: widget.order.address!,
//                           maxLine: 1,
//                           textWidth: 250,
//                           textOverflow: TextOverflow.ellipsis,
//                           fontSize: 15),
//                     ],
//                   ),
//                   const SizedBox(height: 15.0)
//                 ],
//               ),
//             ),
//             (widget.order.status != 'DELIVERED')
//                 ? Container(
//                     padding: const EdgeInsets.all(10.0),
//                     width: MediaQuery.of(context).size.width,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         BlocBuilder<MyLocationMapBloc, MyLocationMapState>(
//                           builder: (context, state) => CenaButton(
//                             text: widget.order.status == 'DISPATCHED'
//                                 ? lang.delivery_detail_button_start
//                                 : lang.delivery_detail_button_gotomap,
//                             color: widget.order.status == 'DISPATCHED'
//                                 ? const Color(0xff0C6CF2)
//                                 : Colors.indigo,
//                             fontWeight: FontWeight.w500,
//                             onPressed: () {
//                               if (widget.order.status == 'DISPATCHED') {
//                                 if (state.location != null) {
//                                   orderBloc.add(OnUpdateStatusOrderOnWayEvent(
//                                       widget.order.orderId.toString(),
//                                       state.location!));
//                                 }
//                               }
//                               if (widget.order.status == 'ON WAY') {
//                                 Navigator.push(
//                                     context,
//                                     routeCena(
//                                         page: MapDeliveryPage(
//                                             order: widget.order)));
//                               }
//                             },
//                           ),
//                         )
//                       ],
//                     ),
//                   )
//                 : Container()
//           ],
//         ),
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
//                               listProductDetails[i].picture!)))),
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
//                         '${S.of(context).delivery_detail_quantity}: ${listProductDetails[i].quantity}',
//                     color: Colors.grey,
//                     fontSize: 17),
//               ],
//             ),
//             Expanded(
//                 child: Container(
//               alignment: Alignment.centerRight,
//               child: CenaTextDescription(
//                   text:
//                       '${numberFormat.format(listProductDetails[i].total)} vnđ'),
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
