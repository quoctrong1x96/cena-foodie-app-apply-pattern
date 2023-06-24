import 'package:cenafoodie/src/utils/themes/theme_maps.dart';
import 'package:flutter/material.dart';

import '../log_utils.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  get themeMode => _themeMode;

  toggleTheme(MyThemeKeys key) {
    _themeMode = key == MyThemeKeys.dark ? ThemeMode.dark : ThemeMode.light;
    LogUtils.debug('ThemeManager', "toggleTheme", _themeMode.toString());
    notifyListeners();
  }
}
