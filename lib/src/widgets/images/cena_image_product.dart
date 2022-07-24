part of '../widgets.dart';

class CenaImageProduct extends StatelessWidget {
  final String image;
  final double width;
  final double height;
  final double padding;
  const CenaImageProduct(
    this.image, {
    Key? key,
    this.padding = 0,
    this.width = 20,
    this.height = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return image == ""
        ? const SizedBox.shrink()
        : Padding(
            padding: EdgeInsets.all(padding),
            child: Image.asset(
              image,
              height: height,
              width: width,
              fit: BoxFit.contain,
            ),
          );
  }
}
