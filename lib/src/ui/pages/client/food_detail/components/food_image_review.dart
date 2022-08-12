import 'package:flutter/material.dart';

import '../../../../../utils/image_ultils.dart';
import '../../../../widgets/widgets.dart';

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
            child: CenaImageCache(url: ImagesUltils.getImageApiUrl(image)),
          ),
        ],
      ),
    );
  }
}
