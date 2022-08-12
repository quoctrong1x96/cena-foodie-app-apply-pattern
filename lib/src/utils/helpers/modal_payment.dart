part of 'helpers.dart';

void modalPaymentWithNewCard(
    {required BuildContext ctx, required String amount}) {
  showModalBottomSheet(
    context: ctx,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black26,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))),
    builder: (context) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CenaTextDescription(
                    text: 'Pay \$ $amount 0',
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
                InkWell(
                    child: const Icon(Icons.close),
                    onTap: () => Navigator.pop(context))
              ],
            ),
            const Divider(),
            const SizedBox(height: 10.0),
            const CenaTextDescription(text: 'Payment Card'),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0)),
              child: const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.0),
                    hintText: 'NUMBER CARD'),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(right: 3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10.0),
                          hintText: '07/26'),
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: const EdgeInsets.only(left: 3.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: const TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10.0),
                          hintText: 'CVV'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8.0)),
              child: const TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 10.0),
                    hintText: 'Email Address'),
              ),
            ),
            const SizedBox(height: 30.0),
            const CenaButton(
              color: Color(0xff002C8B),
              text: 'PAY NOW',
              fontWeight: FontWeight.w500,
              borderRadius: 22,
            )
          ],
        ),
      ),
    ),
  );
}
