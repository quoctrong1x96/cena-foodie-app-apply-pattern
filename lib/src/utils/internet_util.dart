import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'log_util2.dart';

class InternetUtils {
  const InternetUtils._internal();

  static Future<bool> isInternetAvailable() async {
    try {
      var availableStatus = false;
      final connectedStatus = await _isInternetConnected();
      if (connectedStatus) {
        final result = await InternetAddress.lookup('google.com');
        availableStatus = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      }
      LogUtil2.debug(
        'InternetUtils',
        'isInternetAvailable',
        'Status: $availableStatus',
      );
      return availableStatus;
    } on Exception catch (e) {
      LogUtil2.error(
        'InternetUtils',
        'isInternetAvailable',
        e.toString(),
      );
      return false;
    }
  }

  static Future<bool> _isInternetConnected() async {
    final result = await (Connectivity().checkConnectivity());
    return result.first != ConnectivityResult.none;
  }
}
