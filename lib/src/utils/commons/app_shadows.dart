import 'package:flutter/material.dart';
import '../../utils/configs/cena_colors.dart';

class AppShadow {
  static final boxShadow = [
    const BoxShadow(
      color: CenaColors.shadow,
      blurRadius: 3,
      offset: Offset(0, 0),
    ),
  ];
}
