import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../data/app_locator.dart';
import '../../../../data/models/entities/order/order.dart';
import '../../../../data/models/entities/pay_type.dart';
import '../../../../data/models/ui/page_arguments.dart';
import '../../../../data/models/ui/ui_response.dart';
import '../../../../data/services/entities/order_service.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/constants/route_constants.dart';
import '../../../../utils/helpers/cena_indicator.dart';
import '../../../../utils/helpers/date.dart';
import '../../../../utils/navigation_utils.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/widgets.dart';

class ClientOrdersPage extends StatelessWidget {
  ClientOrdersPage({Key? key}) : super(key: key);

  final _orderService = locator<IOrderService>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: payType.length,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CenaAppbarDefault(
            title: "Đơn hàng của tôi",
            centerTitle: true,
            preferredSizeInput: 80,
            leading: const CenaButtonDefaultBack(),
            actions: const [],
            bottom: TabBar(
                indicatorWeight: 2,
                labelColor: CenaColors.primary,
                unselectedLabelColor: Colors.grey,
                indicator: CenaIndicatorTabBar(),
                isScrollable: true,
                tabs: List<Widget>.generate(
                    payType.length,
                    (i) => Tab(
                        child: Text(
                            Localizations.localeOf(context).toString() == "vi"
                                ? payTypeVN[i]
                                : payType[i],
                            style: GoogleFonts.getFont('Roboto',
                                fontSize: 13, color: CenaColors.WHITE))))),
          ),
          body: TabBarView(
            children: payType
                .map((e) => FutureBuilder<UiResponse<List<Order>?>>(
                    future: _orderService.fetchAllByStatusForClient(
                        clientId:
                            BlocProvider.of<UserBloc>(context).state.user!.id,
                        status: e),
                    builder: (context, snapshot) => (!snapshot.hasData)
                        ? Column(
                            children: const [
                              CenaShimmer(),
                              SizedBox(height: 10),
                              CenaShimmer(),
                              SizedBox(height: 10),
                              CenaShimmer(),
                            ],
                          )
                        : _ListOrdersClient(listOrders: snapshot.data!.data!)))
                .toList(),
          ),
        ));
  }
}

class _ListOrdersClient extends StatelessWidget {
  final List<Order> listOrders;

  const _ListOrdersClient({required this.listOrders});

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
    int countOfOder = listOrders.length;
    double amountTotalOfOrder = 0;
    if (listOrders.isNotEmpty) {
      for (var order in listOrders) {
        amountTotalOfOrder += order.amount!;
      }
    }
    final lang = S.of(context);
    return (listOrders.isNotEmpty)
        ? Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  itemCount: listOrders.length,
                  itemBuilder: (context, i) => GestureDetector(
                    onTap: () => NavigationUtils.push(
                        context, RouteConstants.client_order_detail,
                        args: PageArguments(data: {'order': listOrders[i]})),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10.0),
                      padding: const EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.blue[50],
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CenaTextDescription(
                                  text:
                                      '${lang.client_orders_home_key} #${listOrders[i].id}',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: CenaColors.primary),
                              CenaTextDescription(
                                  text: Localizations.localeOf(context)
                                              .toString() ==
                                          "vi"
                                      ? payTypeVN[payType
                                          .indexOf(listOrders[i].status!)]
                                      : listOrders[i].status!,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: (listOrders[i].status == 'DELIVERED'
                                      ? CenaColors.primary
                                      : CenaColors.textBlack)),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CenaTextDescription(
                                text: lang.client_orders_home_total,
                                fontSize: 13,
                              ),
                              CenaTextDescription(
                                  text:
                                      '${numberFormat.format(listOrders[i].amount).toString()} vnđ',
                                  fontSize: 13)
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CenaTextDescription(
                                text: lang.client_orders_home_payment_type,
                                fontSize: 13,
                              ),
                              CenaTextDescription(
                                  text: '${listOrders[i].payType}',
                                  fontSize: 13)
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CenaTextDescription(
                                text: lang.client_orders_home_receiver,
                                fontSize: 13,
                              ),
                              CenaTextDescription(
                                  text: '${listOrders[i].receiver}',
                                  fontSize: 13)
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CenaTextDescription(
                                text: lang.client_orders_home_time,
                                fontSize: 13,
                              ),
                              CenaTextDescription(
                                  text: CenaDate.getDateOrder(
                                      listOrders[i].currentDate.toString()),
                                  fontSize: 13)
                            ],
                          ),
                          const SizedBox(height: 5.0),
                          listOrders[i].status == "ON WAY" ||
                                  listOrders[i].status == "DELIVERED"
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CenaTextDescription(
                                      text: lang.client_orders_home_shipper,
                                      fontSize: 13,
                                    ),
                                    CenaTextDescription(
                                        text:
                                            '${listOrders[i].deliveryName} - ${listOrders[i].deliveryId} ', //!TODO: Thay deliveryId = phone
                                        fontSize: 13)
                                  ],
                                )
                              : const SizedBox(width: 10.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 60.0,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: CenaColors.primary,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0)),
                  boxShadow: [
                    BoxShadow(
                      color: CenaColors.GREY.withOpacity(0.8),
                      spreadRadius: 12,
                      blurRadius: 7,
                      offset: const Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 6.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.boxOpen,
                                size: 10,
                                color: CenaColors.WHITE,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              CenaTextDescription(
                                text:
                                    '${lang.client_orders_home_quantity_cart}: ',
                                fontSize: 15,
                                color: CenaColors.WHITE,
                              ),
                            ],
                          ),
                          CenaTextDescription(
                            text:
                                '$countOfOder ${lang.client_orders_home_items}',
                            fontSize: 15,
                            color: CenaColors.WHITE,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.moneyBill,
                                size: 10,
                                color: CenaColors.WHITE,
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              CenaTextDescription(
                                text:
                                    '${lang.client_orders_home_amount}  $countOfOder ${lang.client_orders_home_items}',
                                fontSize: 15,
                                color: CenaColors.WHITE,
                              ),
                            ],
                          ),
                          CenaTextDescription(
                            text:
                                '${numberFormat.format(amountTotalOfOrder).toString()} vnđ',
                            fontSize: 15,
                            color: CenaColors.WHITE,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        : SvgPicture.asset('Assets/empty-cart.svg');
  }
}
