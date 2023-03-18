import 'package:cenafoodie/src/data/services/entities/order_service.dart';
import 'package:cenafoodie/src/utils/extensions/date_time_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../data/app_locator.dart';
import '../../../../data/models/entities/order/order.dart';
import '../../../../data/models/entities/pay_type.dart';
import '../../../../data/models/ui/ui_response.dart';
import '../../../../utils/helpers/cena_indicator.dart';
import '../../../blocs/store/store_bloc.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/widgets.dart';
import 'order_details_page.dart';

class OrdersAdminPage extends StatelessWidget {
  OrdersAdminPage({Key? key}) : super(key: key);
  final IOrderService _orderService = locator<IOrderService>();

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return DefaultTabController(
        length: payType.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CenaAppbarDefault(
            preferredSizeInput: 80,
            title: lang.admin_order_title,
            leading: const CenaButtonDefaultBack(),
            bottom: TabBar(
                indicatorWeight: 2,
                labelColor: CenaColors.primary,
                unselectedLabelColor: CenaColors.WHITE,
                indicator: CenaIndicatorTabBar(),
                isScrollable: true,
                tabs: List<Widget>.generate(
                    payType.length,
                    (i) => Tab(
                        child: Text(
                            Localizations.localeOf(context).toString() == "vi"
                                ? payTypeVN[i]
                                : payType[i],
                            style:
                                GoogleFonts.getFont('Roboto', fontSize: 17))))),
          ),
          body: TabBarView(
            children: payType
                .map((e) => FutureBuilder<UiResponse<List<Order>?>>(
                    future: _orderService.fetChAllByStatusForStore(
                        storeId:
                            BlocProvider.of<StoreBloc>(context).state.store!.id,
                        status: e),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Column(
                          children: const [
                            CenaShimmer(),
                            SizedBox(height: 10),
                            CenaShimmer(),
                            SizedBox(height: 10),
                            CenaShimmer(),
                          ],
                        );
                      } else {
                        NumberFormat numberFormat =
                            NumberFormat('###,###', 'en_US');
                        double amount = 0.0;
                        for (var e in snapshot.data!.data!) {
                          amount += e.amount ?? 0.0;
                        }
                        return Column(
                          children: [
                            Expanded(
                                child: _ListOrders(
                                    listOrders: snapshot.data!.data!)),
                            Container(
                              height: 52.0,
                              width: MediaQuery.of(context).size.width - 20,
                              margin: const EdgeInsets.only(bottom: 5.0),
                              decoration: BoxDecoration(
                                  color: CenaColors.WHITE,
                                  borderRadius: BorderRadius.circular(8.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: CenaColors.GREY,
                                        blurRadius: 10,
                                        spreadRadius: 2.0)
                                  ]),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 5.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CenaTextDescription(
                                          text: lang.admin_order_total,
                                          fontSize: 16,
                                          color: CenaColors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        CenaTextDescription(
                                          text:
                                              '${snapshot.data!.data!.length} ${lang.admin_order_items}',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CenaTextDescription(
                                          text: lang.admin_order_amount,
                                          fontSize: 16,
                                          color: CenaColors.primary,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        CenaTextDescription(
                                          text:
                                              '${numberFormat.format(amount)} vnđ',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }
                    }))
                .toList(),
          ),
        ));
  }
}

// ignore: unused_element
class _ListOrders extends StatelessWidget {
  final List<Order> listOrders;

  const _ListOrders({required this.listOrders});

  @override
  Widget build(BuildContext context) {
    listOrders.sort((a, b) => b.id.compareTo(a.id));
    return Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 5),
      child: ListView.builder(
        itemCount: listOrders.length,
        itemBuilder: (context, i) => _CardOrders(orderResponse: listOrders[i]),
      ),
    );
  }
}

class _CardOrders extends StatelessWidget {
  final Order orderResponse;

  const _CardOrders({required this.orderResponse});

  @override
  Widget build(BuildContext context) {
    final storeBloc = BlocProvider.of<StoreBloc>(context);
    final lang = S.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 3.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(color: Colors.blueGrey, blurRadius: 8, spreadRadius: -5)
          ]),
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            routeCena(
                page: OrderDetailsPage(
              order: orderResponse,
              store: storeBloc.state.store!,
            ))),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CenaTextDescription(
                text: '${lang.admin_order_orderid} #${orderResponse.id}',
                fontSize: 14,
              ),
              const Divider(),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CenaTextDescription(
                      text: lang.admin_order_time,
                      fontSize: 13,
                      color: CenaColors.secondary),
                  CenaTextDescription(
                      text: orderResponse.currentDate.toStringFormatVN(),
                      fontSize: 13),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CenaTextDescription(
                      text: lang.admin_order_receiver,
                      fontSize: 13,
                      color: CenaColors.secondary),
                  CenaTextDescription(
                      text: orderResponse.receiver!, fontSize: 13),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CenaTextDescription(
                      text: lang.admin_order_address,
                      fontSize: 13,
                      color: CenaColors.secondary),
                  CenaTextDescription(
                      text:
                          orderResponse.address ?? lang.admin_order_no_address,
                      fontSize: 13,
                      textWidth: 220,
                      textOverflow: TextOverflow.ellipsis,
                      maxLine: 1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
