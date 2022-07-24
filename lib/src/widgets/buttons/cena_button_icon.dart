part of '../widgets.dart';

class CenaIconButton extends CenaButtonWidget {
  const CenaIconButton({
    Key? key,
    String? title,
    Widget? leadingIcon,
    double? width,
    Widget? trailingIcon,
    bool isLoading = false,
    TextStyle? textStyle,
    Color? backgroundColor,
    VoidCallback? onPressed,
  }) : super(
          key: key,
          title: title,
          leadingIcon: leadingIcon,
          trailingIcon: trailingIcon,
          isLoading: isLoading,
          onPressed: onPressed,
          textStyle: textStyle,
          width: width,
          backgroundColor: backgroundColor,
        );
}
