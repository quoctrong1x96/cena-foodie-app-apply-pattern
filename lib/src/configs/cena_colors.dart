import 'package:flutter/material.dart';

class CenaColors {
  ///Common
  static const Color primary = Color.fromARGB(255, 243, 25, 189);
  static const Color secondary = Color.fromARGB(255, 21, 160, 215);
  static const Color accent = Color.fromARGB(255, 207, 111, 21);
  static const Color dartGrey = Color.fromARGB(255, 79, 79, 79);

  //Toast color
  static const Color toastInformation = Color.fromARGB(255, 13, 247, 255);
  static const Color toastSuccess = Color.fromARGB(255, 0, 226, 49);
  static const Color toastError = Color.fromARGB(255, 255, 41, 13);

  ///Background
  static const Color background = Color.fromARGB(255, 255, 255, 255);
  static const Color backgroundLighter = Color.fromARGB(255, 47, 58, 78);
  static const Color backgroundDarker = Color(0xff111821);

  ///Shadow
  static const Color shadow = Color(0x25606060);

  ///Border
  static const Color border = Color(0xFF606060);

  ///Divider
  static const Color divider = Color(0xFF606060);

  ///Text
  static const Color textWhite = Color(0xFFFFFFFF);
  static const Color textBlack = Color(0xFF000000);
  static const Color textBlue = Color(0xFF0000FF);
  static const Color textDisable = Color(0xFF89a3b1);

  ///TextField
  static const Color textFieldEnabledBorder = Color(0xFF919191);
  static const Color textFieldFocusedBorder = Color(0xFFd74315);
  static const Color textFieldDisabledBorder = Color(0xFF919191);
  static const Color textFieldCursor = Color(0xFF919191);

  ///Button
  static const Color buttonBGWhite = Color(0xFFcdd0d5);
  static const Color buttonBGTint = Color(0xFFd74315);
  static const Color buttonBorder = Color(0xFFd74315);

  /// Tabs
  static const Color imageBG = Color(0xFF919191);

  ///BottomNavigationBar
  static const Color bottomNavigationBar = Color(0xFF919191);

  // ignore: non_constant_identifier_names
  static final MaterialColor PRIMARY_COLOR = _factoryColor(0xff2B3340);

  // ignore: non_constant_identifier_names
  static final MaterialColor LIGHT = _factoryColor(0xfff4f4f8);

  // ignore: non_constant_identifier_names
  static final MaterialColor GREY = _factoryColor(0xffDCDCDC);

  // ignore: non_constant_identifier_names
  static final MaterialColor LIGHT_GREY = _factoryColor(0xfff5f5f5);

  // ignore: non_constant_identifier_names
  static final MaterialColor DARK = _factoryColor(0xff3a3a3a);

  // ignore: non_constant_identifier_names
  static final MaterialColor WHITE = _factoryColor(0xffffffff);

  // ignore: non_constant_identifier_names
  static final MaterialColor GREEN = _factoryColor(0xff349e40);

  // ignore: non_constant_identifier_names
  static final MaterialColor LIGHT_GREEN = _factoryColor(0xff3AB54A);

  // ignore: non_constant_identifier_names
  static final MaterialColor SHADOW = _factoryColor(0xffE7EAF0);

  static MaterialColor hex(String hex) =>
      CenaColors._factoryColor(CenaColors._getColorHexFromStr(hex));

  static MaterialColor _factoryColor(int color) {
    return MaterialColor(color, <int, Color>{
      50: Color(color),
      100: Color(color),
      200: Color(color),
      300: Color(color),
      400: Color(color),
      500: Color(color),
      600: Color(color),
      700: Color(color),
      800: Color(color),
      900: Color(color),
    });
  }

  static int _getColorHexFromStr(String colorStr) {
    colorStr = "FF" + colorStr;
    colorStr = colorStr.replaceAll("#", "");
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        val = 0xFFFFFFFF;
      }
    }
    return val;
  }
}
