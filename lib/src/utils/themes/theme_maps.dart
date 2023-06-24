import 'package:flutter/material.dart';

import '../importer_utils.dart';

enum MyThemeKeys { light, dark, darker }

class MyThemes with ChangeNotifier {
  MyThemes._internal();
  static final MyThemes _instance = MyThemes._internal();

  static Color lightPrimaryColor = UtilsImporter().colorUtils.primaryColor;
  static Color lightSecondaryColor = UtilsImporter().colorUtils.secondaryColor;

  static MyThemes get instance => _instance;

  static MyThemeKeys? _currentTheme;

  static ThemeMode? _themeMode;

  MyThemeKeys? get currentThemeKey => _currentTheme;

  ThemeMode? get currentThemeMode => _themeMode;

  final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,

    //Scaffol
    scaffoldBackgroundColor: Colors.white,

    textTheme: TextTheme(
      button: TextStyle(
          color: lightPrimaryColor,
          // backgroundColor: Colors.white70,
          fontSize: 15,
          decorationColor: lightPrimaryColor),
      headline1: TextStyle(
          color: lightPrimaryColor,
          // backgroundColor: Colors.white70,
          fontSize: 18),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(const Size.fromHeight(45)),
        alignment: Alignment.center,
        elevation: MaterialStateProperty.all<double>(0.0),
        foregroundColor: MaterialStateProperty.all<Color>(lightPrimaryColor),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            color: lightPrimaryColor,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            // decorationColor: lightPrimaryColor,
            // backgroundColor: Colors.white70,
            fontSize: 17,
          ),
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.all(2.0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          minimumSize:
              MaterialStateProperty.all<Size>(const Size.fromHeight(45)),
          side: MaterialStateProperty.all(
            BorderSide(
              color: lightPrimaryColor,
              width: 1.0,
            ),
          ),
          overlayColor: MaterialStateProperty.all<Color>(Colors.black87),
          mouseCursor:
              MaterialStateProperty.all<MouseCursor>(MouseCursor.uncontrolled),
          foregroundColor: MaterialStateProperty.all<Color>(lightPrimaryColor),
          elevation: MaterialStateProperty.all<double>(0.0),
          textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
            color: lightPrimaryColor,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            // decorationColor: lightPrimaryColor,
            // backgroundColor: Colors.white70,
            fontSize: 17,
          ))),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            alignment: Alignment.center,
            backgroundColor: MaterialStateProperty.all(lightPrimaryColor),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(2.0)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            minimumSize:
                MaterialStateProperty.all<Size>(const Size.fromHeight(45)),
            // side: MaterialStateProperty.all(
            //   BorderSide(
            //     color: lightPrimaryColor,
            //     width: 1.0,
            //   ),
            // ),
            overlayColor: MaterialStateProperty.all<Color>(Colors.black87),
            mouseCursor: MaterialStateProperty.all<MouseCursor>(
                MouseCursor.uncontrolled),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            elevation: MaterialStateProperty.all<double>(0.0),
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              // decorationColor: lightPrimaryColor,
              // backgroundColor: Colors.white70,
              fontSize: 17,
            )))),

    buttonTheme: const ButtonThemeData(
        disabledColor: Colors.white12,
        layoutBehavior: ButtonBarLayoutBehavior.padded,
        materialTapTargetSize: MaterialTapTargetSize.padded),

    //fontFamily
    // fontFamily: ,

    toggleButtonsTheme: ToggleButtonsThemeData(
      // textStyle: TextStyle(),
      borderColor: lightPrimaryColor,
      borderRadius: BorderRadius.zero,
      borderWidth: 1.0,
      color: Colors.black,
      disabledBorderColor: Colors.black38,
      fillColor: Colors.white24,
      disabledColor: Colors.white10,
    ),
    // backgroundColor: UtilsImporter().colorUtils.primaryColor,
    primaryColor: UtilsImporter().colorUtils.primaryColor,
    primaryColorLight: Colors.white,
    highlightColor: UtilsImporter().colorUtils.secondaryColor,
    primaryColorDark: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: UtilsImporter().colorUtils.primaryColor))),
  );

  final ThemeData _darkTheme = ThemeData(
    primaryColor: UtilsImporter().colorUtils.primaryColor,
    highlightColor: UtilsImporter().colorUtils.secondaryColor,
    scaffoldBackgroundColor: UtilsImporter().colorUtils.primaryColor,
    primaryColorLight: Colors.black,
    primaryColorDark: Colors.white,
    brightness: Brightness.dark,
    inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: UtilsImporter().colorUtils.primaryColor))),
  );

  final ThemeData _darkerTheme = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.dark,
  );

  ThemeData getThemeFromKey(MyThemeKeys themeKey) {
    _currentTheme = themeKey;
    _themeMode =
        themeKey == MyThemeKeys.dark ? ThemeMode.dark : ThemeMode.light;
    switch (themeKey) {
      case MyThemeKeys.light:
        return _lightTheme;
      case MyThemeKeys.dark:
        return _darkTheme;
      case MyThemeKeys.darker:
        return _darkerTheme;
      default:
        return _lightTheme;
    }
  }
}

class _CustomTheme extends InheritedWidget {
  final CustomThemeState data;

  const _CustomTheme(
    this.data, {
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_CustomTheme oldWidget) {
    return true;
  }
}

class CustomTheme extends StatefulWidget {
  final Widget child;
  final MyThemeKeys? initialThemeKey;

  const CustomTheme({
    Key? key,
    this.initialThemeKey,
    required this.child,
  }) : super(key: key);

  @override
  CustomThemeState createState() => CustomThemeState();

  static ThemeData? of(BuildContext context) {
    _CustomTheme inherited = (context
        .dependOnInheritedWidgetOfExactType<_CustomTheme>() as _CustomTheme);
    return inherited.data.theme;
  }

  static CustomThemeState instanceOf(BuildContext context) {
    _CustomTheme inherited = (context
        .dependOnInheritedWidgetOfExactType<_CustomTheme>() as _CustomTheme);
    return inherited.data;
  }
}

class CustomThemeState extends State<CustomTheme> {
  ThemeData? _theme;

  ThemeData? get theme => _theme;

  @override
  void initState() {
    _theme = MyThemes.instance.getThemeFromKey(widget.initialThemeKey!);
    super.initState();
  }

  void changeTheme(MyThemeKeys themeKey) {
    setState(() {
      _theme = MyThemes.instance.getThemeFromKey(themeKey);
    });
  }

  @override
  Widget build(BuildContext context) {
    return _CustomTheme(
      this,
      child: widget.child,
    );
  }
}
