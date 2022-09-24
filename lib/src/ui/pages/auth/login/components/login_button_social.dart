import 'package:cenafoodie/src/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/widgets.dart';

class LoginButtonSocial extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isBorder;

  const LoginButtonSocial(
      {Key? key,
      required this.icon,
      required this.text,
      this.onPressed,
      this.backgroundColor,
      this.textColor,
      this.isBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: InkWell(
        onTap: onPressed,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.button_radius),
          child: Container(
            height: 47,
            width: double.maxFinite,
            margin: const EdgeInsets.only(bottom: 3.0),
            decoration: BoxDecoration(
                color: backgroundColor ?? Theme.of(context).primaryColorDark,
                boxShadow: const [AppConstants.app_shadow],
                border:
                    isBorder ? Border.all(color: Colors.grey, width: .7) : null,
                borderRadius:
                    BorderRadius.circular(AppConstants.button_radius)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 30.0),
                icon,
                const SizedBox(width: 50.0),
                CenaTextDescription(
                  text: text,
                  textStyle: textColor == null
                      ? Theme.of(context).textTheme.button!
                      : Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: textColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
