import 'package:cenafoodie/src/data/app_locator.dart';
import 'package:cenafoodie/src/data/models/ui/ui_response.dart';
import 'package:cenafoodie/src/data/services/entities/order_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../data/models/entities/order/order.dart';
import '../../../utils/configs/cena_colors.dart';
import '../../blocs/user/user_bloc.dart';
import '../../resources/generated/l10n.dart';
import '../../widgets/animation_route.dart';
import '../../widgets/widgets.dart';
import 'order_details_delivery_page.dart';

class OrderOnWayPage extends StatelessWidget {
  OrderOnWayPage({Key? key}) : super(key: key);
  final _orderService = locator<IOrderService>();

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Scaffold(
      backgroundColor: CenaColors.WHITE,
      appBar: CenaAppbarDefault(
          title: lang.delivery_detail_onway_title,
          leading: const CenaButtonDefaultBack()),
      body: FutureBuilder<UiResponse<List<Order>?>>(
        future: _orderService.fetchAllByStatusForDelivery(
            deliveryId: BlocProvider.of<UserBloc>(context).state.user!.id,
            status: 'ON WAY'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Column(
              children: const [
                CenaShimmer(),
                SizedBox(height: 10.0),
                CenaShimmer(),
                SizedBox(height: 10.0),
                CenaShimmer(),
              ],
            );
          } else {
            snapshot.data!.data!.sort((a, b) => b.id.compareTo(a.id));
            return _ListOrdersForDelivery(
                listOrdersDelivery: snapshot.data!.data!);
          }
        },
      ),
    );
  }
}

class _ListOrdersForDelivery extends StatelessWidget {
  final List<Order> listOrdersDelivery;

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
                  text: S.of(context).delivery_detail_onway_without_order,
                  color: CenaColors.primary,
                  fontWeight: FontWeight.w500,
                  fontSize: 21)
            ],
          );
  }
}
