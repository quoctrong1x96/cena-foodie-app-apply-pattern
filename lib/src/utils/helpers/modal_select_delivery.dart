part of 'helpers.dart';

void modalSelectDelivery(BuildContext context, String idOrder, Store store) {
  final orderBloc = BlocProvider.of<OrdersBloc>(context);
  final deliveryService = locator<IDeliveryService>();
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white60,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      content: SizedBox(
        height: 400,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    CenaTextDescription(
                        text: 'Cena ',
                        color: CenaColors.primary,
                        fontWeight: FontWeight.w500),
                    CenaTextDescription(
                        text: 'Foodie', fontWeight: FontWeight.w500),
                  ],
                ),
                InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close))
              ],
            ),
            const Divider(),
            const SizedBox(height: 10.0),
            const CenaTextDescription(text: 'Select delivery man'),
            const SizedBox(height: 10.0),
            Expanded(
              child: FutureBuilder<UiResponse<List<Delivery>?>>(
                  future: deliveryService.fetchAllOfStore(storeId: store.id),
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
                      : _ListDeliveryModal(listDelivery: snapshot.data!.data!)),
            ),
            BlocBuilder<DeliveryBloc, DeliveryState>(
              builder: (context, state) => CenaButton(
                text: 'SEND ORDER',
                fontWeight: FontWeight.w500,
                onPressed: () {
                  if (state.idDelivery != '0') {
                    orderBloc.add(OnUpdateStatusOrderToDispatchedEvent(
                        idOrder,
                        state.idDelivery,
                        state.notificationTokenDelivery,
                        store.id,
                        store.latitude,
                        store.longitude));
                    Navigator.pop(context);
                  }
                },
              ),
            )
          ],
        ),
      ),
    ),
  );
}

// ignore: unused_element
class _ListDeliveryModal extends StatelessWidget {
  final List<Delivery> listDelivery;

  const _ListDeliveryModal({required this.listDelivery});

  @override
  Widget build(BuildContext context) {
    final deliveryBloc = BlocProvider.of<DeliveryBloc>(context);

    return ListView.builder(
      itemCount: listDelivery.length,
      itemBuilder: (context, i) => InkWell(
        onTap: () => deliveryBloc.add(OnSelectDeliveryEvent(
            listDelivery[i].id.toString(),
            listDelivery[i].notificationToken.toString())),
        splashColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.only(bottom: 10.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0),
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            ImagesUltils.getImageApiUrl(
                                listDelivery[i].image!)))),
              ),
              const SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(listDelivery[i].name!,
                      maxLines: 1, style: GoogleFonts.getFont('Inter')),
                  const SizedBox(height: 5.0),
                  CenaTextDescription(
                      text: listDelivery[i].phone!, color: Colors.grey),
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  child: BlocBuilder<DeliveryBloc, DeliveryState>(
                      builder: (_, state) =>
                          (state.idDelivery == listDelivery[i].id.toString())
                              ? const Icon(Icons.check_outlined,
                                  size: 30, color: Colors.green)
                              : Container()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
