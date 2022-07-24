part of '../widgets.dart';

class CenaButtonDefaultBack extends StatelessWidget {
  final dynamic result;
  final VoidCallback? action;
  const CenaButtonDefaultBack({Key? key, this.result, this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(FontAwesomeIcons.angleLeft,
          color: CenaColors.WHITE, semanticLabel: "Trở về", size: 18),
      onPressed: action ?? () => Navigator.pop(context, result ?? false),
    );
  }
}
