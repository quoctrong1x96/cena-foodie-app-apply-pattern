import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../configs/cena_colors.dart';
import '../../../../configs/cena_text_styles.dart';
import '../../../../services/url.dart';

class CommentRow extends StatelessWidget {
  final String avatar;
  final String name;
  final double rating;
  final String comment;

  const CommentRow({
    Key? key,
    required this.avatar,
    required this.name,
    required this.rating,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 14,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20,
                width: 20,
                child: Image.network(URLS.URL_API + avatar),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " " + name,
                      style: CenaTextStyles.smallDescription,
                    ),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 5),
                        RatingBar.builder(
                          wrapAlignment: WrapAlignment.start,
                          initialRating: rating,
                          ignoreGestures: true,
                          minRating: 1,
                          itemSize: 15,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            size: 1.0,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                      ],
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      children: [
                        Text(
                          comment,
                          style: CenaTextStyles.smallDescription,
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text("Ngày 01-03-2022 22:22",
                        style: CenaTextStyles.smallDescription),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget storeName() {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        Container(
          width: 62,
          alignment: Alignment.topLeft,
          decoration: const BoxDecoration(color: CenaColors.primary),
          child: const Text(
            " Yêu thích ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 11.0,
            ),
          ),
        ),
        const SizedBox(width: 7),
        const Text(
          " Bánh Mỳ Huỳnh Hoa - Bánh Mì Pate - Bánh mì xông khói",
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
