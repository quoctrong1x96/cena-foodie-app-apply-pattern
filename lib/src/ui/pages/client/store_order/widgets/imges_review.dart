import 'package:flutter/material.dart';

import '../../../../../utils/image_ultils.dart';
import '../../../../widgets/widgets.dart';

class ImageReview extends StatelessWidget {
  const ImageReview({Key? key, this.image}) : super(key: key);
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 250,
          child: CenaImageCache(url: ImagesUltils.getImageApiUrl(image)),
          decoration: const BoxDecoration(color: Colors.white),
        )
      ],
    );
  }
}
