import 'package:flutter/material.dart';

import '../../../../widgets/widgets.dart';

class AppName extends StatelessWidget {
  const AppName({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CenaTextDescription(
            text: 'Cena ',
            fontSize: 16,
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w500),
        CenaTextDescription(
            text: 'Foodie',
            fontSize: 16,
            color: Theme.of(context).primaryColorDark,
            fontWeight: FontWeight.w500),
      ],
    );
  }
}
