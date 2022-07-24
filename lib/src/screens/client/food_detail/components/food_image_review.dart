import 'package:flutter/material.dart';

import '../../../../services/url.dart';

// ignore: must_be_immutable
class FoodImageReview extends StatelessWidget {
  final String image;
  const FoodImageReview(this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 300,
            child: Image.network(URLS.BASE_URL + image),
          ),
        ],
      ),
    );
  }
}
