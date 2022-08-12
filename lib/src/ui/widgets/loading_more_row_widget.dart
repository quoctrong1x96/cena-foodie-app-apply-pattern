import 'package:flutter/material.dart';

import '../../utils/configs/cena_colors.dart';
import 'loading/app_loader_widget.dart';

class LoadingMoreRowWidget extends StatelessWidget {
  final double height;
  final Color color;

  const LoadingMoreRowWidget(
      {Key? key, this.height = 80, this.color = CenaColors.secondary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Container(
        alignment: Alignment.center,
        child: const SizedBox(width: 24, height: 24, child: AppLoaderWidget()
            // CircularProgressIndicator(
            //   backgroundColor: color,
            //   valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondary),
            // ),
            ),
      ),
    );
  }
}
