part of 'widgets.dart';

class CenaButton extends StatelessWidget {
  final String text;
  final Color color;
  final double height;
  final double width;
  final double borderRadius;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final VoidCallback? onPressed;

  const CenaButton(
      {Key? key,
      required this.text,
      this.color = const Color.fromARGB(255, 243, 25, 189),
      this.height = 50,
      this.width = double.infinity,
      this.borderRadius = 1.0,
      this.textColor = Colors.white,
      this.fontWeight = FontWeight.bold,
      this.fontSize = 18,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.symmetric(vertical: AppConstants.margin_all),
      child: TextButton(
        style: TextButton.styleFrom(
            backgroundColor: onPressed == null ? CenaColors.GREY : color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
        child: CenaTextDescription(
          text: text,
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
