part of 'helpers.dart';

void modalDeleteOrder(BuildContext context, String uid) {
  final orderBloc = BlocProvider.of<OrdersBloc>(context);

  showDialog(
    context: context,
    barrierColor: Colors.white54,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      content: SizedBox(
        height: 250,
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
                        color: Colors.red,
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
            CenaTextDescription(
                text: S.of(context).admin_order_delete_confirm_message),
            const SizedBox(height: 20.0),
            CenaButton(
              height: 45,
              color: Colors.red,
              text: S.of(context).admin_order_delete_confirm_button,
              fontWeight: FontWeight.bold,
              onPressed: () {
                orderBloc.add(OnUpdateStatusOrderCancelledEvent(uid));
                Navigator.pop(context);
              },
            ),
            CenaButton(
              height: 45,
              color: CenaColors.secondary,
              text: S.of(context).admin_order_delete_confirm_button_no,
              fontWeight: FontWeight.bold,
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    ),
  );
}
