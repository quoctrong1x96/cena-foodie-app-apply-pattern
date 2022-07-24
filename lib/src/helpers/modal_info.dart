part of 'helpers.dart';

void modalInfoCena(BuildContext context, String text) {
  showDialog(
    context: context,
    barrierDismissible: false,
    barrierColor: Colors.black12,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: SizedBox(
        height: 270,
        child: Column(
          children: [
            Row(
              children: const [
                CenaTextDescription(
                    text: 'Cena ',
                    color: Colors.amber,
                    fontWeight: FontWeight.w500),
                CenaTextDescription(
                    text: 'Foodie', fontWeight: FontWeight.w500),
              ],
            ),
            const Divider(),
            const SizedBox(height: 10.0),
            Container(
              height: 90,
              width: 90,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      colors: [Colors.white, Colors.amber])),
              child: Container(
                margin: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.amber),
                child: const Icon(Icons.priority_high_rounded,
                    color: Colors.white, size: 38),
              ),
            ),
            const SizedBox(height: 35.0),
            CenaTextDescription(
                text: text, fontSize: 17, fontWeight: FontWeight.w400),
            const SizedBox(height: 20.0),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                alignment: Alignment.center,
                height: 35,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(5.0)),
                child: const CenaTextDescription(
                    text: 'OK', color: Colors.white, fontSize: 16),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
