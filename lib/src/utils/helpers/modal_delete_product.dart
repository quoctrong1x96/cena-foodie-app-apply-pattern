part of 'helpers.dart';

void modalDeleteProduct(BuildContext context, int storeId, String name,
    String image, int productId) {
  final productBloc = BlocProvider.of<ProductsBloc>(context);

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
                text: S.of(context).admin_product_delete_confirm_message),
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
                              ImagesUltils.getImageApiUrl(image)))),
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
              height: 45,
              color: Colors.red,
              text: S.of(context).admin_product_delete_confirm_button,
              fontWeight: FontWeight.bold,
              onPressed: () {
                productBloc.add(OnDeleteProductEvent(storeId, productId));
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    ),
  );
}
