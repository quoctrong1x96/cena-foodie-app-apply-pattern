part of 'widgets.dart';

class CenaTextDescription extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextOverflow textOverflow;
  final int maxLine;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final double? textWidth;

  const CenaTextDescription(
      {Key? key,
      required this.text,
      this.fontSize = 18,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.textOverflow = TextOverflow.visible,
      this.maxLine = 1,
      this.textWidth,
      this.textAlign = TextAlign.left,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: textWidth,
      child: Text(text,
          overflow: textOverflow,
          maxLines: maxLine,
          textAlign: textAlign,
          style: textStyle ??
              GoogleFonts.getFont('Roboto',
                  fontSize: fontSize, color: color, fontWeight: fontWeight)),
    );
  }
}

class CenaTextGroup extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextOverflow textOverflow;
  final int maxLine;
  final TextAlign textAlign;
  final TextStyle? textStyle;

  const CenaTextGroup(
      {Key? key,
      required this.text,
      this.fontSize = 16,
      this.color = Colors.black,
      this.fontWeight = FontWeight.bold,
      this.textOverflow = TextOverflow.visible,
      this.maxLine = 1,
      this.textAlign = TextAlign.left,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5.0),
      color: Theme.of(context).primaryColorLight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(text,
            overflow: textOverflow,
            maxLines: maxLine,
            textAlign: textAlign,
            style: textStyle ??
                GoogleFonts.getFont('Roboto',
                    fontSize: fontSize, color: color, fontWeight: fontWeight)),
      ),
    );
  }
}

class CenaTextAppbar extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextOverflow textOverflow;
  final int maxLine;
  final TextAlign textAlign;
  final TextStyle? textStyle;

  const CenaTextAppbar(
      {Key? key,
      required this.text,
      this.fontSize = 18,
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.textOverflow = TextOverflow.visible,
      this.maxLine = 1,
      this.textAlign = TextAlign.left,
      this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        overflow: textOverflow,
        maxLines: maxLine,
        textAlign: textAlign,
        style: textStyle ??
            GoogleFonts.getFont('Roboto',
                fontSize: fontSize, color: color, fontWeight: fontWeight));
  }
}
