import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../configs/cena_colors.dart';

class AppLoaderWidget extends StatelessWidget {
  const AppLoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // bool isDark = (Theme.of(context).brightness == Brightness.dark);
    return SpinKitDoubleBounce(color: CenaColors.GREEN);
  }
}
