import 'package:flutter/material.dart';

class ColorUtils {
  Color primaryColor = HexColor("F15BB5"); //Pink
  Color secondaryColor = HexColor("9B5DE5"); //Violet

  Color darkColor = HexColor("3D56F0");
  Color greyColor = HexColor("929794");

  Color searchGreyColor = HexColor("e6e6e6");
  Color blueColor = HexColor("5468FF");
  Color lightVioletColor = HexColor("7085C3");
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
