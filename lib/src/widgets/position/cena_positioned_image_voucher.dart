import 'package:flutter/material.dart';

import '../../configs/cena_colors.dart';
import '../../configs/cena_paddings.dart';
import '../../configs/cena_text_styles.dart';

class CenaPositionedImageVoucher extends StatelessWidget {
  final String text;
  const CenaPositionedImageVoucher(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 3,
      left: 3,
      child: Container(
        height: 15,
        color: CenaColors.secondary,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: CenaPaddings.all5),
          child: Text(
            text,
            style: CenaTextStyles.whiteS12,
          ),
        )),
      ),
    );
  }
}
