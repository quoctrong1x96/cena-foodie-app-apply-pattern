part of 'helpers.dart';

Future<BitmapDescriptor> getAssetImageMarker(String imagePath) async {
  return await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(devicePixelRatio: 2.5), imagePath);
}
