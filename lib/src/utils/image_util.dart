import 'package:cenafoodie/src/utils/constants/cena_service_constants.dart';

class ImagesUtil {
  const ImagesUtil._internal();

  static String getImageApiUrl(String? baseUrl) {
    try {
      var url = '';
      url += "${CenaServiceConstants.URL_SCHEME}://";
      url += CenaServiceConstants.BASE_URL;
      url += ":${CenaServiceConstants.URL_PORT}";
          url += '/';
      return baseUrl == null ? 'Assets/no-image@2x.png' : url + baseUrl;
    } catch (e) {
      return 'Assets/no-image@2x.png';
    }
  }
}
