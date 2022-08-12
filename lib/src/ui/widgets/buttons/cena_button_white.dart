part of '../widgets.dart';

class AppWhiteButton extends CenaButtonWidget {
  const AppWhiteButton({
    Key? key,
    @required String? title,
    bool isLoading = false,
    VoidCallback? onPressed,
  }) : super(
          key: key,
          title: title,
          isLoading: isLoading,
          onPressed: onPressed,
          textStyle: const TextStyle(
            fontSize: 16,
            color: CenaColors.secondary,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Colors.white,
        );
}
