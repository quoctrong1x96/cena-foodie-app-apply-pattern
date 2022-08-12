part of 'widgets.dart';

class CenaShimmer extends StatelessWidget {
  final double? width;
  final double? height;
  const CenaShimmer({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: const Color(0xFFF3F3F3),
      child: Container(
        height: height ?? 50,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.grey[200]),
      ),
    );
  }
}
