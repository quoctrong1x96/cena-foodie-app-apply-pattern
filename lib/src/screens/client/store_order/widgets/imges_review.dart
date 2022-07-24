import 'package:flutter/material.dart';

import '../../../../services/url.dart';

class ImageReview extends StatelessWidget {
  const ImageReview({Key? key, this.image}) : super(key: key);
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 250,
          child: Image.network(URLS.BASE_URL + image!),
          decoration: const BoxDecoration(color: Colors.white),
        )
      ],
    );
  }
}
