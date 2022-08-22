import 'package:cenafoodie/src/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../utils/themes/theme_maps.dart';

class LoginChangeThemeButton extends StatefulWidget {
  final Widget parrentWidget;
  final MyThemeKeys? myThemeKey;
  final GlobalKey? key;
  const LoginChangeThemeButton(
      {this.key, required this.myThemeKey, required this.parrentWidget})
      : super(key: key);

  @override
  State<LoginChangeThemeButton> createState() => _LoginChangeThemeButtonState();
}

class _LoginChangeThemeButtonState extends State<LoginChangeThemeButton>
    with SingleTickerProviderStateMixin {
  MyThemeKeys? _keys;
  MyThemeKeys? _oldKeys;
  late Offset switcherOffset;
  late AnimationController _controller;

  @override
  void initState() {
    _keys = widget.myThemeKey;
    _oldKeys = _keys;

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(Widget oldWidget) {
    if (_oldKeys != _keys) {
      _getSwitcherCoodinates();
      _controller.reset();
      _controller.forward().then(
        (_) {
          _changeTheme(context);
        },
      );
    }
    super.didUpdateWidget(oldWidget as LoginChangeThemeButton);
  }

  void _getSwitcherCoodinates() {
    RenderBox renderObject =
        widget.key!.currentContext!.findRenderObject() as RenderBox;
    switcherOffset = renderObject.localToGlobal(Offset.zero);
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return IconButton(
      onPressed: () => _changeTheme(context),
      icon: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: _theme.primaryColorDark,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(40)),
        ),
        child: _keys == MyThemeKeys.dark
            ? Icon(
                FontAwesomeIcons.moon,
                color: _theme.primaryColorDark,
                size: 20.0,
              )
            : Icon(
                FontAwesomeIcons.sun,
                color: _theme.primaryColorDark,
                size: 20.0,
              ),
      ),
    );
  }

  void _changeTheme(BuildContext buildContext) {
    setState(() {
      _keys = _keys == MyThemeKeys.light ? MyThemeKeys.dark : MyThemeKeys.light;
    });
    CustomTheme.instanceOf(buildContext)
        .changeTheme(_keys ?? MyThemeKeys.light);
    LogUtils.debug('LoginChangeThemeButton', "_changeTheme", _keys.toString());
    // AnimatedBuilder(
    //   animation: _controller,
    //   child: widget.parrentWidget,
    //   builder: (_, child) {
    //     return ClipPath(
    //       clipper: MyClipper(
    //         sizeRate: _controller.value,
    //         offset: switcherOffset.translate(30, 15),
    //       ),
    //       child: child,
    //     );
    //   },
    // );
  }
}

class MyClipper extends CustomClipper<Path> {
  MyClipper({required this.sizeRate, required this.offset});
  final double sizeRate;
  final Offset offset;

  @override
  Path getClip(Size size) {
    var path = Path()
      ..addOval(
        Rect.fromCircle(center: offset, radius: size.height * sizeRate),
      );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class _InheritedBrandTheme extends InheritedWidget {
  final CustomTheme data;

  const _InheritedBrandTheme({
    required this.data,
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedBrandTheme oldWidget) {
    return true;
  }
}

ThemeData defaultThemeData = ThemeData(
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(),
  ),
);

class ThemeRoute extends PageRouteBuilder {
  ThemeRoute(this.widget)
      : super(
          pageBuilder: (
            context,
            animation,
            secondaryAnimation,
          ) =>
              widget,
          transitionsBuilder: transitionsBuilder,
        );

  final Widget widget;
}

Widget transitionsBuilder(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  var _animation = Tween<double>(
    begin: 0,
    end: 100,
  ).animate(animation);
  return SlideTransition(
    position: Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(animation),
    child: Container(
      child: child,
    ),
  );
}
