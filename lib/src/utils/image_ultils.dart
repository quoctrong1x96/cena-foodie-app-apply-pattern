import 'package:cenafoodie/src/utils/constants/cena_service_constants.dart';

class ImagesUltils {
  const ImagesUltils._internal();

  static String getImageApiUrl(String? baseUrl) {
    try {
      var url = '';
      url += CenaServiceConstants.URL_SCHEME + "://";
      url += CenaServiceConstants.BASE_URL;
      if (CenaServiceConstants.URL_PORT != null) {
        url += ":" + CenaServiceConstants.URL_PORT.toString();
      }
      url += '/';
      return baseUrl == null ? 'Assets/no-image@2x.png' : url + baseUrl;
    } catch (e) {
      return 'Assets/no-image@2x.png';
    }
  }
}
