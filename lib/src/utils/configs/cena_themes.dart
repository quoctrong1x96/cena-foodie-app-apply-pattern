import 'package:flutter/material.dart';

class CenaThemes {
  CenaThemes._();

  //Font
  static String lightFont = "Arimo";
  static String darkFont = "Arimo";

  //Primary
  static const Color _lightPrimaryColor = Color(0xffffffff);
  static const Color _darkPrimaryColor = Color(0xFF1a222d);

  //Secondary
  static const Color _darkSecondaryColor = Color(0xFFd74315);

  //Background
  static const Color _lightBackgroundColor = Color(0xffffffff);
  static const Color _darkBackgroundColor = Color(0xFF1a222d);

  //Text
  static const Color _lightTextColor = Color(0xff000000);
  static const Color _darkTextColor = Color(0xffffffff);

  //Border
  // ignore: unused_field
  static const Color _lightBorderColor = Colors.grey;
  // ignore: unused_field
  static const Color _darkBorderColor = Colors.grey;

  //Icon
  static const Color _lightIconColor = Color(0xff000000);
  static const Color _darkIconColor = Color(0xffffffff);

  //Text themes
  static const TextTheme _lightTextTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 96.0, color: _lightTextColor),
    headlineMedium: TextStyle(fontSize: 60.0, color: _lightTextColor),
    headlineSmall: TextStyle(fontSize: 48.0, color: _lightTextColor),
    titleLarge: TextStyle(
        fontSize: 20.0, color: _lightTextColor, fontWeight: FontWeight.w500),
    titleMedium: TextStyle(fontSize: 16.0, color: _lightTextColor),
    titleSmall: TextStyle(
        fontSize: 14.0, color: _lightTextColor, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 18.0, color: _lightTextColor),
    bodyMedium: TextStyle(fontSize: 16.0, color: _lightTextColor),
    bodySmall: TextStyle(fontSize: 14.0, color: _lightTextColor),
    labelLarge: TextStyle(
        fontSize: 14.0, color: _lightTextColor, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(fontSize: 12.0, color: _lightTextColor),
    labelMedium: TextStyle(fontSize: 14.0, color: _lightTextColor),
  );

  static const TextTheme _darkTextTheme = TextTheme(
    headlineLarge: TextStyle(fontSize: 96.0, color: _darkTextColor),
    headlineMedium: TextStyle(fontSize: 60.0, color: _darkTextColor),
    headlineSmall: TextStyle(fontSize: 48.0, color: _darkTextColor),
    titleLarge: TextStyle(
        fontSize: 20.0, color: _darkTextColor, fontWeight: FontWeight.w500),
    titleMedium: TextStyle(fontSize: 16.0, color: _darkTextColor),
    titleSmall: TextStyle(
        fontSize: 14.0, color: _darkTextColor, fontWeight: FontWeight.w500),
    bodyLarge: TextStyle(fontSize: 18.0, color: _darkTextColor),
    bodyMedium: TextStyle(fontSize: 16.0, color: _darkTextColor),
    bodySmall: TextStyle(fontSize: 14.0, color: _darkTextColor),
    labelLarge: TextStyle(
        fontSize: 14.0, color: _darkTextColor, fontWeight: FontWeight.w500),
    labelSmall: TextStyle(fontSize: 12.0, color: _darkTextColor),
    labelMedium: TextStyle(fontSize: 14.0, color: _darkTextColor),

  );

  ///Light theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: _lightPrimaryColor,
    // ignore: deprecated_member_use
    colorScheme: ColorScheme(brightness: Brightness.light, 
    primary: _lightPrimaryColor, onPrimary: _lightPrimaryColor, secondary: _darkSecondaryColor, 
    onSecondary: _darkSecondaryColor, error: _darkSecondaryColor, onError: _darkSecondaryColor, 
    surface: _lightPrimaryColor, onSurface: _lightPrimaryColor) ,
    fontFamily: darkFont,
    scaffoldBackgroundColor: _lightBackgroundColor,
    appBarTheme: const AppBarTheme(
      color: _lightBackgroundColor,
      iconTheme: IconThemeData(color: _lightIconColor),
      // ignore: deprecated_member_use
      // textTheme: _lightTextTheme,
    ),
    iconTheme: const IconThemeData(
      color: _lightIconColor,
    ),
    textTheme: _lightTextTheme,
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
    ),
  );

  ///Dark theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _darkPrimaryColor,
    // accentColor: _darkSecondaryColor,
    fontFamily: darkFont,
    scaffoldBackgroundColor: _darkBackgroundColor,
    appBarTheme: const AppBarTheme(
      color: _darkBackgroundColor,
      iconTheme: IconThemeData(color: _darkIconColor),
      // ignore: deprecated_member_use
      // textTheme: _darkTextTheme,
    ),
    iconTheme: const IconThemeData(
      color: _darkIconColor,
    ),
    textTheme: _darkTextTheme,
    dividerTheme: const DividerThemeData(
      color: Colors.grey,
    ),
  );
}
