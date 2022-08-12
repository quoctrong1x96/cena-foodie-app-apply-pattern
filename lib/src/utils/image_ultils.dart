import 'package:cenafoodie/src/utils/constants/cena_service_constants.dart';

class ImagesUltils {
  const ImagesUltils._internal();

  static String getImageApiUrl(String? baseUrl) {
    return baseUrl == null
        ? 'Assets/no-image@2x.png'
        : CenaServiceConstants.BASE_URL + baseUrl;
  }
}
