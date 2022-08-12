// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import '../..//ui/blocs/user/user_bloc.dart';
// import '../../../utils/configs/cena_colors.dart';
// import '../../controllers/delivery_controller.dart';
// import '../../resources/generated/l10n.dart';
// import '../../models/response/orders_by_status_response.dart';
// import '../../widgets/animation_route.dart';
// import '../../widgets/widgets.dart';
// import 'order_details_delivery_page.dart';

// class OrderOnWayPage extends StatelessWidget {
//   const OrderOnWayPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final lang = S.of(context);
//     return Scaffold(
//       backgroundColor: CenaColors.WHITE,
//       appBar: CenaAppbarDefault(
//           title: lang.delivery_detail_onway_title,
//           leading: const CenaButtonDefaultBack()),
//       body: FutureBuilder<List<OrdersResponse>?>(
//         future: deliveryController.getOrdersForDelivery(
//             BlocProvider.of<UserBloc>(context).state.user!.uid!, 'ON WAY'),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Column(
//               children: const [
//                 CenaShimmer(),
//                 SizedBox(height: 10.0),
//                 CenaShimmer(),
//                 SizedBox(height: 10.0),
//                 CenaShimmer(),
//               ],
//             );
//           } else {
//             snapshot.data!.sort((a, b) => b.orderId!.compareTo(a.orderId!));
//             return _ListOrdersForDelivery(listOrdersDelivery: snapshot.data!);
//           }
//         },
//       ),
//     );
//   }
// }

// class _ListOrdersForDelivery extends StatelessWidget {
//   final List<OrdersResponse> listOrdersDelivery;

//   const _ListOrdersForDelivery({required this.listOrdersDelivery});

//   @override
//   Widget build(BuildContext context) {
//     return (listOrdersDelivery.isNotEmpty)
//         ? ListView.builder(
//             itemCount: listOrdersDelivery.length,
//             itemBuilder: (_, i) => CardOrdersDelivery(
//                   orderResponse: listOrdersDelivery[i],
//                   onPressed: () => Navigator.push(
//                       context,
//                       routeCena(
//                           page: OrdersDetailsDeliveryPage(
//                               order: listOrdersDelivery[i]))),
//                 ))
//         : Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                   child: SvgPicture.asset('Assets/no-data.svg', height: 300)),
//               const SizedBox(height: 15.0),
//               CenaTextDescription(
//                   text: S.of(context).delivery_detail_onway_without_order,
//                   color: CenaColors.primary,
//                   fontWeight: FontWeight.w500,
//                   fontSize: 21)
//             ],
//           );
//   }
// }
