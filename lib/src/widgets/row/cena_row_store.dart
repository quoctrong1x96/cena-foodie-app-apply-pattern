import '../../configs/cena_paddings.dart';
import '../position/cena_positioned_image_voucher.dart';
import '../widgets.dart';
import '../position/cena_positioned_image_like.dart';
import '../../configs/cena_colors.dart';
import '../../configs/cena_text_styles.dart';
import 'package:flutter/material.dart';

class CenaRowStore extends StatelessWidget {
  final int storeId;
  final String? image;
  final String name;
  final double rating;
  final String categories;
  final double space;
  final int time;
  final String? voucher;
  final VoidCallback? onTab;

  const CenaRowStore({
    Key? key,
    required this.storeId,
    this.image,
    this.onTab,
    required this.categories,
    required this.name,
    this.rating = 0.1,
    this.space = 1.0,
    this.time = 10,
    this.voucher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        color: CenaColors.background,
        height: (100),
        width: double.infinity,
        child: Row(
          children: <Widget>[
            Stack(children: [
              CenaImageSquare(image, 100, () {}, () {}),
              const CenaPositionedImageTopLeft("Yêu thích"),
              const CenaPositionedImageVoucher("Voucher"),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                  child: Row(
                    children: <Widget>[
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.home_sharp,
                        color: CenaColors.primary,
                      ),
                      Text(" " + name,
                          textAlign: TextAlign.left,
                          style: CenaTextStyles.blackS14Bold)
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                  child: Row(
                    children: [
                      const SizedBox(width: 5),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 20,
                      ),
                      Text(
                        rating.toString(),
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.normal,
                            fontSize: 12.0),
                      ),
                      const Text(" | "),
                      const Icon(
                        Icons.location_pin,
                        color: Colors.grey,
                        size: 20,
                      ),
                      SizedBox(
                        width: 60,
                        child: Text(
                          "${space.toString()} km",
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: CenaTextStyles.greyS12,
                        ),
                      ),
                      const Text(" | "),
                      const Icon(
                        Icons.lock_clock,
                        color: Colors.grey,
                        size: 20,
                      ),
                      SizedBox(
                        width: 90,
                        child: Text(
                          "${(space * 1000 / 500 + 10).toStringAsFixed(0)} min",
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: CenaTextStyles.greyS12,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: CenaPaddings.all5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (var item in categories.split(',')) Text(item + ", "),
                    ],
                  ),
                ),
                voucher! != ""
                    ? Row(
                        children: [
                          const SizedBox(width: 5),
                          Container(
                            height: 25,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: CenaColors.primary,
                                width: (1),
                              ),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 2),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: Center(
                                      child: Text(
                                    voucher!,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: CenaColors.primary,
                                      fontSize: 12,
                                    ),
                                  )),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    : Row(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CenaRowStoreShimmer extends StatelessWidget {
  const CenaRowStoreShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CenaColors.background,
      height: (100),
      child: Row(
        children: <Widget>[
          const CenaImageSquareShimmer(100),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 3,
              ),
              SizedBox(
                height: 25,
                child: Row(
                  children: <Widget>[
                    CenaShimmer(
                      width: MediaQuery.of(context).size.width - 150,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 25,
                child: Row(
                  children: <Widget>[
                    CenaShimmer(width: MediaQuery.of(context).size.width - 150)
                  ],
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 25,
                child: Row(
                  children: <Widget>[
                    CenaShimmer(width: MediaQuery.of(context).size.width - 150)
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
