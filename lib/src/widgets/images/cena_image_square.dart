part of '../widgets.dart';

class CenaImageSquare extends StatelessWidget {
  final double height;
  final String? image;
  final VoidCallback? onPressedChange;
  final VoidCallback? onPressedTake;
  const CenaImageSquare(
      this.image, this.height, this.onPressedChange, this.onPressedTake,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: height,
      child: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () =>
              onPressedTake ??
              modalPictureRegister(
                  ctx: context,
                  onPressedChange: onPressedChange,
                  onPressedTake: onPressedTake),
          child: image != null
              ? Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: height - 5 <= 0 ? 10 : height - 5,
                    width: height - 5 <= 0 ? 10 : height - 5,
                    decoration: BoxDecoration(
                        color: CenaColors.primary,
                        shape: BoxShape.rectangle,
                        image: image != ""
                            ? DecorationImage(
                                image: CachedNetworkImageProvider(
                                    URLS.BASE_URL + image.toString()),
                                fit: BoxFit.cover)
                            : null),
                  ),
                )
              : const CircularProgressIndicator()),
    );
  }
}

class CenaImageSquareShimmer extends StatelessWidget {
  final double height;
  const CenaImageSquareShimmer(this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: height,
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: height - 5 <= 0 ? 10 : height - 5,
            width: height - 5 <= 0 ? 10 : height - 5,
            child: const CenaShimmer(),
          ),
        ));
  }
}
