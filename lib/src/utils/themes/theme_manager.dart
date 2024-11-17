import 'package:cenafoodie/src/utils/themes/theme_maps.dart';
import 'package:flutter/material.dart';

import '../log_util2.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  get themeMode => _themeMode;

  toggleTheme(MyThemeKeys key) {
    _themeMode = key == MyThemeKeys.dark ? ThemeMode.dark : ThemeMode.light;
    LogUtil2.debug('ThemeManager', "toggleTheme", _themeMode.toString());
    notifyListeners();
  }
}
