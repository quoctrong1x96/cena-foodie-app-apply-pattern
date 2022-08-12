part of 'helpers.dart';

void modalPictureRegister(
    {required BuildContext ctx,
    VoidCallback? onPressedChange,
    VoidCallback? onPressedTake}) {
  showModalBottomSheet(
    context: ctx,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black12,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
    builder: (context) => Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      height: 180,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40.0),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 10, spreadRadius: -5.0)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CenaTextDescription(
                text: 'Change profile picture', fontWeight: FontWeight.w500),
            const SizedBox(height: 8.0),
            SizedBox(
              height: 52,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 0,
                margin: const EdgeInsets.all(0),
                child: InkWell(
                  onTap: onPressedChange,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: CenaTextDescription(
                      text: 'Select an image',
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 52,
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 0,
                margin: const EdgeInsets.all(0),
                child: InkWell(
                  onTap: onPressedTake,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: CenaTextDescription(
                      text: 'Take a picture',
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
