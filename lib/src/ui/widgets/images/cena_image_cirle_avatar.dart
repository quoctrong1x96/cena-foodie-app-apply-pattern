part of '../widgets.dart';

class CenaImageCircleAvatar extends StatelessWidget {
  final String url;
  final double? size;

  const CenaImageCircleAvatar({Key? key, this.url = "", this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isValidUrl = Uri.tryParse(url)?.isAbsolute == true;
    return Container(
      width: size ?? double.infinity,
      height: size ?? double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular((size ?? 0) / 2),
      ),
      child: isValidUrl
          ? ClipRRect(
              borderRadius: BorderRadius.circular((size ?? 0) / 2),
              child: CachedNetworkImage(
                imageUrl: url,
                progressIndicatorBuilder: (context, url, downloadProgress) {
                  return SizedBox(
                    width: size,
                    height: size,
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                      strokeWidth: 2,
                    ),
                  );
                },
                errorWidget: (context, url, error) {
                  return SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Image.asset(
                      CenaImages.icAvatar,
                      fit: BoxFit.cover,
                    ),
                  );
                },
                fit: BoxFit.fill,
              ),
            )
          : SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                CenaImages.icAvatar,
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
