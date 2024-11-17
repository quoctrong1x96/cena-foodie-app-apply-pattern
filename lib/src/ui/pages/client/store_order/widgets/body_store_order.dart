import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../data/models/entities/store/store.dart';
import '../../../../../utils/configs/cena_colors.dart';
import '../../../../../utils/configs/cena_text_styles.dart';
import '../../../../resources/generated/l10n.dart';
import '../../../../widgets/widgets.dart';
import 'store_image_review.dart';
import 'tab_bar.dart';

class Body extends StatelessWidget {
  final Store store;
  const Body({Key? key, required this.store}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 30,
                color: Colors.red,
                child: Text("red"),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 30,
                color: Colors.blue,
                child: Text("blue"),
              )
            ],
          ),
          Row(
            children: [
              Container(
                height: 30,
                color: Colors.orange,
                child: Text("orage"),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text('''...............
          fdsfafiasofsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
fdsfafiasofsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
          fsdfsdfdsfafiasofsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
          fsdfsdfdsfafiasofsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
          fsdfsdfdsfafiasofsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
          fsdfsdfdsfafiasofsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
          fsdfsdfdsfafiasofsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
          fsdfsdfdsfafiasofsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
          fsdfsdfdsfafiasofsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
          fsdfsdfdsfafiasofsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
          fsdfsdfdsfafiasofsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
          fsdfsdfdsfafiasofsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
          fsdfsdfdsfafiasofsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
          fsdfsdfdsfafiasofsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
          fsdfsd
          '''),
          )
        ],
      ),
      // child: ListView(
      //     padding: const EdgeInsets.symmetric(horizontal: 10.0),
      //     physics: const BouncingScrollPhysics(),
      //     children: [
      //       // StoreImageReview(store),
      //       const SizedBox(height: 10),
      //       storeName(store, context),
      //       ratingStore(store, context),
      //       const Divider(),
      //       CustomTabs(store: store),
      //     ]),
    );
  }

  Padding ratingStore(Store store, BuildContext context) {
    final lang = S.of(context);
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RatingBar.builder(
            wrapAlignment: WrapAlignment.start,
            initialRating: 4.6,
            ignoreGestures: true,
            minRating: 0,
            itemSize: 20,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              size: 1.0,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              // ignore: avoid_print
              print(rating);
            },
          ),
          const Text("4.6", style: CenaTextStyles.smallDescription),
          const Text(
            " | (",
            style: CenaTextStyles.smallDescription,
          ),
          const Text(
            "100",
            style: CenaTextStyles.smallDescription,
          ),
          Text(
            " ${lang.store_order_comments}) ",
            style: CenaTextStyles.smallDescription,
          ),
          const Text(
            " | ",
            style: CenaTextStyles.smallDescription,
          ),
          const Icon(
            Icons.lock_clock,
            color: Colors.grey,
          ),
          Text(
            " ${(double.parse(store.distance!.toString()) * 1000 / 500 + 10).toStringAsFixed(0)} ${lang.store_order_min}",
            style: CenaTextStyles.smallDescription,
          ),
        ],
      ),
    );
  }
}
