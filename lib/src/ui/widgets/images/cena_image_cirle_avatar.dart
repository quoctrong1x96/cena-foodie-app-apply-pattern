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
      child: isValidUrl
          ? ClipRRect(
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
              borderRadius: BorderRadius.circular((size ?? 0) / 2),
            )
          : SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                CenaImages.icAvatar,
                fit: BoxFit.cover,
              ),
            ),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular((size ?? 0) / 2),
      ),
    );
  }
}
