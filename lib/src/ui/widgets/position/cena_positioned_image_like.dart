import 'package:cenafoodie/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../utils/configs/cena_colors.dart';
import '../../../utils/configs/cena_text_styles.dart';

class CenaPositionedImageTopLeft extends StatelessWidget {
  final String text;
  const CenaPositionedImageTopLeft(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      left: 0,
      child: Container(
        height: 15,
        color: CenaColors.primary,
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
