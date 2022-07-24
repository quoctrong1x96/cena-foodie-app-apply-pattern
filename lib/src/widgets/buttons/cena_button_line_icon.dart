part of '../widgets.dart';

class CenaButtonLineIcon extends StatelessWidget {
  final double borderRadius;
  final String text;
  final IconData icon;
  final Color colorIcon;
  final bool isDisable;
  final VoidCallback? onPressed;
  final double fontSize;

  const CenaButtonLineIcon({
    Key? key,
    this.borderRadius = 0.0,
    required this.text,
    required this.icon,
    this.fontSize = 16.0,
    required this.colorIcon,
    this.isDisable = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: CenaMargins.topButton),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        elevation: 0,
        color: CenaColors.WHITE, // Colors.grey[100],
        margin: const EdgeInsets.all(0),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(
            padding: const EdgeInsets.only(
                left: CenaPaddings.left, right: CenaPaddings.right),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isDisable ? Colors.grey : colorIcon),
                      child:
                          Icon(icon, size: fontSize + 4.0, color: Colors.white),
                    ),
                    const SizedBox(width: 8.0),
                    CenaTextDescription(
                        text: text,
                        fontSize: fontSize,
                        color: !isDisable ? Colors.black : Colors.grey),
                  ],
                ),
                const Icon(Icons.navigate_next_rounded)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CenaButtonLineText extends StatelessWidget {
  final double borderRadius;
  final String label;
  final String text;
  final double fontSize;
  final VoidCallback? onPressed;
  final TextOverflow? textOverflow;
  final double? labelWidth;

  const CenaButtonLineText(
      {Key? key,
      this.borderRadius = 0.0,
      required this.text,
      required this.label,
      this.labelWidth,
      this.textOverflow,
      this.onPressed,
      this.fontSize = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDisable = onPressed == null;
    return Container(
      height: 45,
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: CenaMargins.topButton),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        elevation: 0,
        color: CenaColors.WHITE, // Colors.grey[100],
        margin: const EdgeInsets.all(0),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(
            padding: const EdgeInsets.only(
                left: CenaPaddings.left, right: CenaPaddings.right),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CenaTextDescription(
                  textWidth: labelWidth ?? 150,
                  text: label,
                  color: Colors.black,
                  textAlign: TextAlign.left,
                  fontSize: fontSize,
                  textOverflow: textOverflow ?? TextOverflow.visible,
                ),
                Row(
                  children: [
                    CenaTextDescription(
                        text: text,
                        fontSize: fontSize,
                        color: !isDisable
                            ? Colors.black
                            : Colors.black.withAlpha(100)),
                    !isDisable
                        ? const Icon(Icons.navigate_next_rounded)
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CenaButtonLineImage extends StatelessWidget {
  final double borderRadius;
  final String? image;
  final String text;
  final VoidCallback? onPressed;
  final int fontSize;

  const CenaButtonLineImage({
    Key? key,
    this.borderRadius = 0.0,
    this.image,
    this.fontSize = 16,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDisable = onPressed == null;
    return Container(
      height: 60,
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: CenaMargins.topButton),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        elevation: 0,
        color: CenaColors.WHITE, // Colors.grey[100],
        margin: const EdgeInsets.all(0),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(
            padding: const EdgeInsets.only(
              left: CenaPaddings.left,
              right: CenaPaddings.right,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CenaImageCirclePicker(false, 55, image),
                Row(
                  children: [
                    CenaTextDescription(text: text, color: CenaColors.primary),
                    !isDisable
                        ? const Icon(Icons.navigate_next_rounded)
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CenaButtonLineDatePicker extends StatelessWidget {
  final double borderRadius;
  final String label;
  final String text;
  final VoidCallback? onPressed;

  const CenaButtonLineDatePicker({
    Key? key,
    this.borderRadius = 0.0,
    required this.text,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: CenaMargins.topButton),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(borderRadius)),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        elevation: 0,
        color: CenaColors.WHITE, // Colors.grey[100],
        margin: const EdgeInsets.all(0),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius),
          child: Padding(
            padding: const EdgeInsets.only(
                left: CenaPaddings.left, right: CenaPaddings.right),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CenaTextDescription(
                  text: label,
                  color: Colors.black,
                  textAlign: TextAlign.left,
                ),
                Row(
                  children: const [
                    AppLabelDatePicker(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
