import 'package:flutter/material.dart';

import '../importer_utils.dart';

enum MyThemeKeys { light, dark, darker }

class MyThemes {
  MyThemes._internal();
  static final MyThemes _instance = MyThemes._internal();

  static MyThemes get instance => _instance;

  static MyThemeKeys? _currentTheme;

  MyThemeKeys? get currentThemeKey => _currentTheme;

  final ThemeData _lightTheme = ThemeData(
    primaryColor: UtilsImporter().colorUtils.primaryColor,
    primaryColorLight: Colors.white,
    highlightColor: UtilsImporter().colorUtils.secondaryColor,
    primaryColorDark: Colors.black,
    brightness: Brightness.light,
    inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: UtilsImporter().colorUtils.primaryColor))),
  );

  final ThemeData _darkTheme = ThemeData(
    primaryColor: UtilsImporter().colorUtils.primaryColor,
    highlightColor: UtilsImporter().colorUtils.secondaryColor,
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
