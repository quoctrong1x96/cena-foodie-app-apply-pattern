import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../ui/resources/generated/l10n.dart';

class CenaDate {
  static String getDateCena(BuildContext context) {
    int time = DateTime.now().hour;
    final lang = S.of(context);

    if (time < 12) {
      return lang.client_home_good_morning;
    } else if (time > 12 && time < 18) {
      return lang.client_home_good_afternoon;
    } else if (time < 24 && time > 18) {
      return lang.client_home_good_night;
    } else {
      return lang.client_home_good;
    }
  }

  static String getDateOrder(String date) {
    var newStr = date.substring(0, 10) + ' ' + date.substring(11, 23);

    DateTime dt = DateTime.parse(newStr);
    return DateFormat("EEE, dd/MM/yyyy HH:mm:ss").format(dt);
  }
}
