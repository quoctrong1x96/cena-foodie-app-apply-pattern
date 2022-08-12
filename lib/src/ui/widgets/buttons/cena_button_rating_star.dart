part of '../widgets.dart';

class CenaButtonRatingStar extends StatelessWidget {
  final double borderRadius;
  final String label;
  final double star;
  final bool canChange;
  final double fontSize;
  final VoidCallback? onPressed;
  final TextOverflow? textOverflow;
  final double? labelWidth;

  const CenaButtonRatingStar(
      {Key? key,
      this.borderRadius = 0.0,
      required this.star,
      required this.label,
      this.labelWidth,
      this.textOverflow,
      this.canChange = false,
      this.onPressed,
      this.fontSize = 18})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDisable = onPressed == null;
    return Container(
      height: 45,
      width: double.maxFinite,
      margin: const EdgeInsets.only(top: AppConstants.margin_topButton),
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
                left: AppConstants.padding_left,
                right: AppConstants.padding_right),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CenaTextDescription(
                  textWidth: labelWidth ?? 100,
                  text: label,
                  color: Colors.black,
                  textAlign: TextAlign.left,
                  fontSize: fontSize,
                  textOverflow: textOverflow ?? TextOverflow.visible,
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: star,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ignoreGestures: canChange,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
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
