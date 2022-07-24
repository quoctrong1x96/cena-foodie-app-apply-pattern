import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../blocs/order/orders_bloc.dart';
import '../../../configs/cena_colors.dart';
import '../../../controllers/orders_controller.dart';
import '../../../generated/l10n.dart';
import '../../../helpers/date.dart';
import '../../../helpers/helpers.dart';
import '../../../models/response/order_details_response.dart';
import '../../../models/response/orders_by_status_response.dart';
import '../../../models/store/store_model.dart';
import '../../../services/url.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/widgets.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrdersResponse order;
  final Store store;

  const OrderDetailsPage({Key? key, required this.order, required this.store})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
    final lang = S.of(context);
    return BlocListener<OrdersBloc, OrdersState>(
      listener: (context, state) {
        if (state is LoadingOrderState) {
          modalLoading(context);
        } else if (state is SuccessOrdersState) {
          Navigator.pop(context);
          cenaToastSuccess(lang.admin_order_detail_success);

          Navigator.pop(context);
          Navigator.pushReplacement(
              context, routeCena(page: const OrdersAdminPage()));
        } else if (state is FailureOrdersState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  CenaTextDescription(text: state.error, color: Colors.white),
              backgroundColor: Colors.red));
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CenaAppbarDefault(
          title: "${lang.admin_order_detail_title} #${order.orderId}",
          leading: const CenaButtonDefaultBack(),
        ),
        body: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              alignment: Alignment.centerLeft,
              child: CenaTextDescription(
                  text: lang.admin_order_detail_list,
                  color: CenaColors.secondary,
                  textAlign: TextAlign.left,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            const Divider(),
            Expanded(
                flex: 7,
                child: FutureBuilder<List<DetailsOrder>?>(
                    future: ordersController
                        .getOrderDetailsById(order.orderId.toString()),
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
                        : _ListProductsDetails(
                            listProductDetails: snapshot.data!))),
            Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CenaTextDescription(
                              text: lang.admin_order_detail_amount_total,
                              color: CenaColors.secondary,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                          CenaTextDescription(
                              text:
                                  '${numberFormat.format(order.amount).toString()} vnđ',
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CenaTextDescription(
                              text: lang.admin_order_detail_customer,
                              color: CenaColors.secondary,
                              fontSize: 13),
                          CenaTextDescription(
                            text: '${order.client}',
                            fontSize: 13,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CenaTextDescription(
                              text: lang.admin_order_detail_time,
                              color: CenaColors.secondary,
                              fontSize: 13),
                          CenaTextDescription(
                              text: CenaDate.getDateOrder(
                                  order.currentDate.toString()),
                              fontSize: 13),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CenaTextDescription(
                              text: lang.admin_order_detail_address,
                              color: CenaColors.secondary,
                              fontSize: 13),
                          CenaTextDescription(
                            textWidth: 300,
                            text: order.address ??
                                lang.admin_order_detail_no_address,
                            maxLine: 1,
                            fontSize: 13,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      (order.status != 'PAID OUT')
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CenaTextDescription(
                                    text: lang.admin_order_detail_delivery,
                                    fontSize: 13,
                                    color: CenaColors.secondary),
                                Row(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  URLS.BASE_URL +
                                                      order.deliveryImage!))),
                                    ),
                                    const SizedBox(width: 10.0),
                                    CenaTextDescription(
                                        text: order.delivery!, fontSize: 13)
                                  ],
                                )
                              ],
                            )
                          : Container()
                    ],
                  ),
                )),
            (order.status == 'PAID OUT')
                ? Container(
                    padding: const EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 70,
                          child: Center(
                            child: CenaButton(
                              color: CenaColors.LIGHT_GREY,
                              textColor: CenaColors.GREY,
                              text: lang.admin_order_detail_cancel,
                              fontSize: 13,
                              onPressed: () => modalDeleteOrder(
                                  context, order.orderId.toString()),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 100,
                          child: Center(
                            child: CenaButton(
                              text: lang.admin_order_detail_select_delivery,
                              fontWeight: FontWeight.w500,
                              onPressed: () => modalSelectDelivery(
                                  context, order.orderId.toString(), store),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}

class _ListProductsDetails extends StatelessWidget {
  final List<DetailsOrder> listProductDetails;

  const _ListProductsDetails({required this.listProductDetails});

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
    return Scrollbar(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        itemCount: listProductDetails.length,
        separatorBuilder: (_, index) => const Divider(),
        itemBuilder: (_, i) => Container(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            URLS.BASE_URL + listProductDetails[i].picture!),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CenaTextDescription(
                      fontSize: 13,
                      text: listProductDetails[i].nameProduct!,
                      fontWeight: FontWeight.w500),
                  const SizedBox(height: 5.0),
                  CenaTextDescription(
                      text:
                          '${S.of(context).admin_order_detail_count}: ${listProductDetails[i].quantity}',
                      color: Colors.grey,
                      fontSize: 13),
                ],
              ),
              Expanded(
                  child: Container(
                alignment: Alignment.centerRight,
                child: CenaTextDescription(
                    fontSize: 13,
                    text:
                        '${numberFormat.format(listProductDetails[i].total).toString()} vnđ'),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
