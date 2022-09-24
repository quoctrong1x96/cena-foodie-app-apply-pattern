import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/app_locator.dart';
import '../../../data/models/entities/order/order.dart';
import '../../../data/models/ui/ui_response.dart';
import '../../../data/services/entities/order_service.dart';
import '../../../utils/configs/cena_colors.dart';
import '../../blocs/user/user_bloc.dart';
import '../../resources/generated/l10n.dart';
import '../../widgets/animation_route.dart';
import '../../widgets/widgets.dart';
import 'order_details_delivery_page.dart';

class ListOrdersDeliveryPage extends StatelessWidget {
  ListOrdersDeliveryPage({Key? key}) : super(key: key);
  final _deliveryService = locator<IOrderService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CenaAppbarDefault(
        title: S.of(context).delivery_order_list_assigned,
        leading: const CenaButtonDefaultBack(),
      ),
      body: FutureBuilder<UiResponse<List<Order>?>>(
          future: _deliveryService.fetchAllByStatusForDelivery(
              deliveryId: BlocProvider.of<UserBloc>(context).state.user!.id,
              status: 'DISPATCHED'),
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
              : _ListOrdersForDelivery(
                  listOrdersDelivery: snapshot.data!.data!)),
    );
  }
}

class _ListOrdersForDelivery extends StatelessWidget {
  final List<Order> listOrdersDelivery;

  const _ListOrdersForDelivery({required this.listOrdersDelivery});

  @override
  Widget build(BuildContext context) {
    listOrdersDelivery.sort((a, b) => b.id.compareTo(a.id));
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
                  text: S.of(context).delivery_order_list_assigned_non,
                  color: CenaColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 21)
            ],
          );
  }
}
