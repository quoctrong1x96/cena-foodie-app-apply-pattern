part of 'helpers.dart';

void modalDelete(
    BuildContext context, String name, String image, VoidCallback onPressed) {
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
            CenaTextDescription(text: S.of(context).common_are_you_sure),
            const SizedBox(height: 20.0),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          scale: 7,
                          image: CachedNetworkImageProvider(
                              URLS.BASE_URL + image))),
                ),
                const SizedBox(width: 10.0),
                CenaTextDescription(
                  text: name,
                  maxLine: 2,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            CenaButton(
              height: 60,
              color: Colors.red,
              text: S.of(context).common_delete,
              fontWeight: FontWeight.bold,
              onPressed: onPressed,
            )
          ],
        ),
      ),
    ),
  );
}
