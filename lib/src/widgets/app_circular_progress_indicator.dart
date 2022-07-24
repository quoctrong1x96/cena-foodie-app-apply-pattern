import 'package:flutter/material.dart';

import '../configs/cena_colors.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  final Color color;

  const AppCircularProgressIndicator(
      {Key? key, this.color = CenaColors.secondary})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          backgroundColor: color,
          valueColor: const AlwaysStoppedAnimation<Color>(CenaColors.secondary),
        ),
      ),
    );
  }
}
