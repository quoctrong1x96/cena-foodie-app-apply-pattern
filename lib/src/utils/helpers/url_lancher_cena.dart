part of 'helpers.dart';

class UrlLauncherCena {
  Future<void> openMapLaunch(String latitude, String longitude) async {
    String url = 'google.navigation:q=$latitude,$longitude&mode=d';
    var urlGoogleMap =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    try {
      Uri uri = Uri.parse(url);
      bool isLaunched = await launchUrl(uri, mode: LaunchMode.externalApplication);
          
      if (!isLaunched) {
        Uri uriGoogleMap = Uri.parse(urlGoogleMap);
        await launchUrl(uriGoogleMap, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  Future<void> makePhoneCall(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}

final urlLauncherCena = UrlLauncherCena();
