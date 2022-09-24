import 'package:flutter/material.dart';

import '../../../widgets/widgets.dart';

class IntroSocialButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isBorder;

  const IntroSocialButton({
    Key? key,
    required this.icon,
    required this.text,
    this.onPressed,
    this.backgroundColor = const Color(0xffF5F5F5),
    this.textColor = Colors.black,
    this.isBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: onPressed,
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
              color: backgroundColor,
              border:
                  isBorder ? Border.all(color: Colors.grey, width: .7) : null,
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(
            children: [
              const SizedBox(width: 30.0),
              Icon(icon, color: isBorder ? Colors.black87 : Colors.white),
              const SizedBox(width: 20.0),
              CenaTextDescription(text: text, color: textColor, fontSize: 17)
            ],
          ),
        ),
      ),
    );
  }
}
