import 'package:flutter/material.dart';

import '../../../../../utils/image_util.dart';
import '../../../../widgets/widgets.dart';

class ImageReview extends StatelessWidget {
  const ImageReview({Key? key, this.image, required this.height})
      : super(key: key);
  final String? image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: CenaImageCache(url: ImagesUtil.getImageApiUrl(image)),
      decoration: const BoxDecoration(color: Colors.white),
    );
  }
}
