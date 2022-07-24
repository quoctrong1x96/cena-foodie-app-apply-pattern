part of 'helpers.dart';

void modalLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.white54,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      content: SizedBox(
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const Divider(),
            const SizedBox(height: 10.0),
            Row(
              children: const [
                CircularProgressIndicator(color: CenaColors.primary),
                SizedBox(width: 15.0),
                CenaTextDescription(text: 'Loading...')
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
