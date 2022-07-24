import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../blocs/user/user_bloc.dart';
import '../../configs/cena_colors.dart';
import '../../controllers/delivery_controller.dart';
import '../../generated/l10n.dart';
import '../../models/response/orders_by_status_response.dart';
import '../../widgets/animation_route.dart';
import '../../widgets/widgets.dart';
import 'order_details_delivery_page.dart';

class OrderDeliveredPage extends StatelessWidget {
  const OrderDeliveredPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CenaAppbarDefault(
        leading: const CenaButtonDefaultBack(),
        title: lang.delivery_detail_delivered_title,
      ),
      body: FutureBuilder<List<OrdersResponse>?>(
          future: deliveryController.getOrdersForDelivery(
              BlocProvider.of<UserBloc>(context).state.user!.uid!, 'DELIVERED'),
          builder: (context, snapshot) => (!snapshot.hasData)
              ? Column(
                  children: const [
                    CenaShimmer(),
                    SizedBox(height: 10.0),
                    CenaShimmer(),
                    SizedBox(height: 10.0),
                    CenaShimmer(),
                  ],
                )
              : _ListOrdersForDelivery(listOrdersDelivery: snapshot.data!)),
    );
  }
}

class _ListOrdersForDelivery extends StatelessWidget {
  final List<OrdersResponse> listOrdersDelivery;

  const _ListOrdersForDelivery({required this.listOrdersDelivery});

  @override
  Widget build(BuildContext context) {
    return (listOrdersDelivery.isNotEmpty)
        ? ListView.builder(
            itemCount: listOrdersDelivery.length,
            itemBuilder: (_, i) => CardOrdersDelivery(
                  orderResponse: listOrdersDelivery[i],
                  onPressed: () => Navigator.push(
                      context,
                      routeCena(
                          page: OrdersDetailsDeliveryPage(
                              order: listOrdersDelivery[i]))),
                ))
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: SvgPicture.asset('Assets/no-data.svg', height: 300)),
              const SizedBox(height: 15.0),
              CenaTextDescription(
                  text: S.of(context).delivery_detail_delivered_without_order,
                  color: CenaColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 21)
            ],
          );
  }
}
