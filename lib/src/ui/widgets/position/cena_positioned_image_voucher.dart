import 'package:flutter/material.dart';

import '../../../utils/configs/cena_colors.dart';
import '../../../utils/configs/cena_text_styles.dart';
import '../../../utils/constants/app_constants.dart';

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
          padding:
              const EdgeInsets.symmetric(horizontal: AppConstants.padding_all5),
          child: Text(
            text,
            style: CenaTextStyles.whiteS12,
          ),
        )),
      ),
    );
  }
}
