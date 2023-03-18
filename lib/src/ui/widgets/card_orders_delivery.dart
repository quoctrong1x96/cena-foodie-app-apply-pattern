part of 'widgets.dart';

class CardOrdersDelivery extends StatelessWidget {
  final Order orderResponse;
  final VoidCallback? onPressed;

  const CardOrdersDelivery(
      {Key? key, required this.orderResponse, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _storeService = locator<IStoreService>();
    final lang = S.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      decoration: BoxDecoration(
          color: CenaColors.WHITE,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: -5)
          ]),
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CenaTextDescription(
                  text:
                      '${lang.delivery_detail_cart_order_id} #${orderResponse.id}',
                  fontSize: 14,
                  color: CenaColors.primary),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CenaTextDescription(
                      text: lang.delivery_detail_cart_store,
                      fontSize: 12,
                      color: CenaColors.secondary),
                  FutureBuilder<UiResponse<Store?>>(
                      future:
                          _storeService.byId(storeId: orderResponse.storeId!),
                      builder: (_, snapshot) {
                        return CenaTextDescription(
                            text: snapshot.hasData
                                ? snapshot.data!.data!.storeName
                                : '...',
                            fontSize: 12);
                      }),
                ],
              ),
              const SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CenaTextDescription(
                      text: lang.delivery_detail_cart_store_address,
                      fontSize: 12,
                      color: CenaColors.secondary),
                  FutureBuilder<UiResponse<Store?>>(
                      future:
                          _storeService.byId(storeId: orderResponse.storeId!),
                      builder: (_, snapshot) {
                        return CenaTextDescription(
                            text: snapshot.hasData
                                ? snapshot.data!.data!.storeName
                                : "...",
                            textWidth: 25,
                            textOverflow: TextOverflow.ellipsis,
                            fontSize: 12);
                      }),
                ],
              ),
              const SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CenaTextDescription(
                      text: lang.delivery_detail_cart_time,
                      fontSize: 12,
                      color: CenaColors.secondary),
                  CenaTextDescription(
                      text: orderResponse.currentDate.toStringFormatVN(),
                      fontSize: 12),
                ],
              ),
              const SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CenaTextDescription(
                      text: lang.delivery_detail_cart_receiver,
                      fontSize: 12,
                      color: CenaColors.secondary),
                  CenaTextDescription(
                      text: orderResponse.receiver!, fontSize: 12),
                ],
              ),
              const SizedBox(height: 6.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CenaTextDescription(
                      text: lang.delivery_detail_cart_dilivery_address,
                      fontSize: 12,
                      color: CenaColors.secondary),
                  CenaTextDescription(
                    text: orderResponse.address!,
                    fontSize: 12,
                    maxLine: 1,
                    textOverflow: TextOverflow.ellipsis,
                    textWidth: 220,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
