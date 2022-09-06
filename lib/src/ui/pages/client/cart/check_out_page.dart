import 'package:cenafoodie/src/data/app_locator.dart';
import 'package:cenafoodie/src/data/services/entities/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/entities/address/address.dart';
import '../../../../data/models/entities/cart/cart.dart';
import '../../../../data/models/entities/store/store.dart';
import '../../../../data/models/entities/type_payment.dart';
import '../../../../data/models/entities/voucher/voucher_free_ship.dart';
import '../../../../data/models/entities/voucher/voucher_subtract.dart';
import '../../../../data/services/entities/address_service.dart';
import '../../../../utils/configs/cena_text_styles.dart';
import '../../../../utils/image_ultils.dart';
import '../../../blocs/cart/cart_bloc.dart';
import '../../../blocs/order/orders_bloc.dart';
import '../../../blocs/payment/payments_bloc.dart';
import '../../../../utils/configs/cena_colors.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../../blocs/user/user_bloc.dart';
import '../../../resources/generated/l10n.dart';
import '../../../widgets/animation_route.dart';
import '../../../widgets/snackbars/cena_snackbar_toast.dart';
import '../../../widgets/widgets.dart';
import '../../profile/list_addresses_page.dart';
import '../client_home_page.dart';

class CheckOutPage extends StatelessWidget {
  final Store store;
  const CheckOutPage(this.store, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    final paymentBloc = BlocProvider.of<PaymentsBloc>(context);
    final userBloc = BlocProvider.of<UserBloc>(context);
    int totalOrders = 0;
    final lang = S.of(context);

    return BlocListener<OrdersBloc, OrdersState>(
      listener: (context, state) {
        if (state is LoadingOrderState) {
          modalLoading(context);
        } else if (state is SuccessOrdersState) {
          Navigator.pop(context);
          cenaToastSuccess(lang.client_payment_success);
          cartBloc.add(OnClearCartEvent());
          paymentBloc.add(OnClearTypePaymentMethodEvent());
          if (userBloc.state.address == null) {
            userBloc.add(OnInitialCurrentAddressEvent(
                userBloc.state.user!.id,
                userBloc.state.user!.firstName +
                    " " +
                    userBloc.state.user!.lastName,
                userBloc.state.user!.phone));
          }
          Navigator.pushAndRemoveUntil(context,
              routeCena(page: const ClientHomePage()), (route) => false);
        } else if (state is FailureOrdersState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content:
                  CenaTextDescription(text: state.error, color: Colors.white),
              backgroundColor: Colors.red));
        }
      },
      child: Scaffold(
        appBar: CenaAppbarDefault(
            title: lang.client_payment_title,
            leading: const CenaButtonDefaultBack()),
        backgroundColor: CenaColors.LIGHT_GREY,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            routeCena(
                                page: const ListAddressesPage(
                              isSelectAddress: true,
                            ))),
                        child: Container(
                            // height: 120,
                            color: CenaColors.WHITE,
                            child: Column(
                              children: [
                                _CheckoutAddress(),
                                const SizedBox(height: 10.0),
                              ],
                            )),
                      ),
                      _buildDetailOrder(context, store, totalOrders),
                    ],
                  ),
                  Container(
                    color: CenaColors.WHITE,
                    child: Column(
                      children: [
                        const Divider(),
                        _CheckoutPaymentMethods(),
                        const SizedBox(height: 10.0),
                      ],
                    ),
                  ),
                  Container(
                    child: _buildButtonPayment(context),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButtonPayment(BuildContext context) {
    final orderBloc = BlocProvider.of<OrdersBloc>(context);
    final userBloc = BlocProvider.of<UserBloc>(context);
    final cartBloc = BlocProvider.of<CartBloc>(context);
    final paymentBloc = BlocProvider.of<PaymentsBloc>(context);
    return BlocBuilder<PaymentsBloc, PaymentsState>(
        builder: (context, state) => InkWell(
              onTap: () {
                orderBloc.add(OnAddNewOrdersEvent(
                    userBloc.state.address!.id,
                    cartBloc.state.total,
                    paymentBloc.state.typePaymentMethod,
                    cartBloc.product,
                    store.id));
              },
              child: Container(
                height: 55,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: state.colorPayment,
                    borderRadius: BorderRadius.circular(15.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(state.iconPayment, color: Colors.white),
                    const SizedBox(width: 10.0),
                    CenaTextDescription(
                        text: Localizations.localeOf(context).toString() != "vi"
                            ? state.typePaymentMethod
                            : listTypePaymentVN[state.index],
                        color: Colors.white)
                  ],
                ),
              ),
            ));
  }

  Widget _buildDetailOrder(BuildContext context, Store store, int finalTotal) {
    final cardBloc = BlocProvider.of<CartBloc>(context);
    final lang = S.of(context);
    NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
    List<Cart> listProduct = cardBloc.product
        .where((element) => element.storeId == store.id)
        .toList();

    int quantity = 0;
    double total = 0.0;
    int shipping = 15000;
    Voucher freeShipVoucher = CenaVoucherFreeShip(
        id: 1,
        name: lang.client_payment_promotion_freeship,
        productCarts: listProduct,
        shippingFee: shipping,
        store: store);
    if (listProduct.isNotEmpty) {
      for (var product in listProduct) {
        quantity += product.quantity;
        total = total + product.quantity * product.price;
      }
    }
    finalTotal = freeShipVoucher.totalApply().toInt();
    return Container(
      color: CenaColors.WHITE,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        children: [
          const Divider(),
          SizedBox(
            child: Row(
              children: [
                const Icon(FontAwesomeIcons.basketShopping,
                    size: 18, color: CenaColors.primary),
                const SizedBox(width: 8.0),
                CenaTextDescription(
                    text: lang.client_payment_order_detail,
                    fontWeight: FontWeight.w500),
              ],
            ),
          ),
          const Divider(),
          Container(
            color: CenaColors.LIGHT_GREY,
            child: ListView.builder(
                itemCount: listProduct.length,
                shrinkWrap: true,
                itemBuilder: (context, i) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CenaImageCache(
                                  url: ImagesUltils.getImageApiUrl(
                                      listProduct[i].productImage),
                                  height: 20,
                                  width: 20,
                                  fit: BoxFit.contain),
                              const SizedBox(width: 5.0),
                              CenaTextDescription(
                                  text:
                                      '${listProduct[i].quantity} x ${listProduct[i].productName}',
                                  textStyle: CenaTextStyles.greyS12),
                            ],
                          ),
                          CenaTextDescription(
                              text:
                                  '${numberFormat.format((listProduct[i].quantity * listProduct[i].price).toInt()).toString()} vnđ',
                              textStyle: CenaTextStyles.greyS12),
                        ],
                      ),
                    )),
          ),
          SizedBox(
            child: Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CenaTextDescription(
                        text:
                            '${lang.client_payment_total_items} ($quantity ${lang.client_payment_items}})',
                        fontSize: 14,
                      ),
                      CenaTextDescription(
                        text:
                            '${numberFormat.format((total).toInt()).toString()} vnđ',
                        fontSize: 14,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CenaTextDescription(
                        text: lang.client_payment_fee_vat,
                        fontSize: 14,
                      ),
                      CenaTextDescription(
                        text:
                            '${numberFormat.format((5000.0).toInt()).toString()} vnđ',
                        fontSize: 14,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CenaTextDescription(
                        text: '${lang.client_payment_fee_shipping} (1 km)',
                        fontSize: 14,
                      ),
                      CenaTextDescription(
                        text: '${numberFormat.format(shipping).toString()} vnđ',
                        fontSize: 14,
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.receipt,
                            size: 18,
                            color: CenaColors.primary,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          CenaTextDescription(
                              text: lang.client_payment_promotion_title,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                      InkWell(
                          onTap: () {},
                          child: const Icon(
                            FontAwesomeIcons.angleRight,
                            size: 15,
                          ))
                    ],
                  ),
                  const Divider(),
                  freeShipVoucher.widgetApplyVoucher(),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CenaTextDescription(
                          color: CenaColors.primary,
                          text: lang.client_payment_total_order,
                          fontWeight: FontWeight.w500),
                      CenaTextDescription(
                          text:
                              '${numberFormat.format(finalTotal + 5000).toString()} vnđ',
                          color: CenaColors.primary,
                          fontWeight: FontWeight.w500),
                    ],
                  ),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class _CheckoutPaymentMethods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paymentBloc = BlocProvider.of<PaymentsBloc>(context);
    final lang = S.of(context);
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: 155,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    FontAwesomeIcons.moneyBills,
                    size: 18,
                    color: CenaColors.primary,
                  ),
                  const SizedBox(width: 8),
                  CenaTextDescription(
                      text: lang.client_payment_payment_method,
                      fontWeight: FontWeight.w500),
                ],
              ),
            ],
          ),
          const Divider(),
          const SizedBox(height: 5.0),
          SizedBox(
            height: 80,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: TypePaymentMethod.listTypePayment.length,
              itemBuilder: (_, i) => InkWell(
                onTap: () {
                  if (TypePaymentMethod.listTypePayment[i].typePayment ==
                      "CASH PAYMENT") {
                    paymentBloc.add(OnSelectTypePaymentMethodEvent(
                        i,
                        TypePaymentMethod.listTypePayment[i].typePayment,
                        TypePaymentMethod.listTypePayment[i].icon,
                        TypePaymentMethod.listTypePayment[i].color));
                  } else {
                    //
                  }
                },
                child: BlocBuilder<PaymentsBloc, PaymentsState>(
                  builder: (_, state) => Container(
                    height: 80,
                    width: 80,
                    margin: const EdgeInsets.only(right: 10.0),
                    decoration: BoxDecoration(
                        color:
                            (TypePaymentMethod.listTypePayment[i].typePayment ==
                                    state.typePaymentMethod)
                                ? const Color.fromARGB(255, 230, 211, 130)
                                : CenaColors.LIGHT_GREY,
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey[200]!)),
                    child: Icon(TypePaymentMethod.listTypePayment[i].icon,
                        size: 40,
                        color:
                            TypePaymentMethod.listTypePayment[i].typePayment ==
                                    "CASH PAYMENT"
                                ? TypePaymentMethod.listTypePayment[i].color
                                : CenaColors.GREY),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CheckoutAddress extends StatelessWidget {
  final _addressService = locator<IAddressService>();
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(
                      FontAwesomeIcons.locationDot,
                      size: 18,
                      color: CenaColors.primary,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    CenaTextDescription(
                        text: lang.client_payment_address_delivery,
                        fontWeight: FontWeight.w500),
                  ],
                ),
                InkWell(
                    onTap: () => {},
                    child: const Icon(
                      FontAwesomeIcons.angleRight,
                      size: 15,
                    ))
              ],
            ),
            const Divider(),
            const SizedBox(height: 5.0),
            BlocBuilder<UserBloc, UserState>(
              builder: (_, state) => state.address!.id == -1
                  ? CenaTextDescription(
                      text: lang.client_payment_address_non,
                      color: CenaColors.accent,
                    )
                  : FutureBuilder<Address?>(
                      future: _addressService
                          .byId(
                              userId: state.user!.id,
                              addressId: state.address!.id)
                          .then((value) => value.data),
                      builder: (context, snapshot) => (!snapshot.hasData)
                          ? Column(
                              children: const [
                                CenaShimmer(),
                                SizedBox(height: 10.0),
                              ],
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 25,
                                  child: CenaTextDescription(
                                      text: (snapshot.data!.detail != '')
                                          ? snapshot.data!.detail!
                                          : lang.client_payment_address_select,
                                      fontSize: 14,
                                      textOverflow: TextOverflow.ellipsis,
                                      maxLine: 1),
                                ),
                                snapshot.data!.receiver!.name != ''
                                    ? Row(
                                        children: [
                                          CenaTextDescription(
                                              text: (snapshot.data!.receiver!
                                                          .name !=
                                                      '')
                                                  ? '${lang.client_payment_receiver}: ${snapshot.data!.receiver}'
                                                  : ' ',
                                              fontSize: 14,
                                              maxLine: 1),
                                          const CenaTextDescription(
                                              text: " - "),
                                          CenaTextDescription(
                                              text: (snapshot.data!.receiver!
                                                          .phoneNumber !=
                                                      '')
                                                  ? snapshot.data!.receiver!
                                                      .phoneNumber!
                                                  : ' ',
                                              fontSize: 14,
                                              maxLine: 1),
                                        ],
                                      )
                                    : const SizedBox(width: 1),
                                snapshot.data!.note != ''
                                    ? CenaTextDescription(
                                        text: (snapshot.data!.note != '')
                                            ? '${lang.client_payment_note}: "${snapshot.data!.note!}"'
                                            : ' ',
                                        fontSize: 12,
                                        textAlign: TextAlign.left,
                                        maxLine: 1)
                                    : const SizedBox(
                                        width: 10,
                                      ),
                              ],
                            )),
            ),
          ],
        ),
      ),
    );
  }
}
