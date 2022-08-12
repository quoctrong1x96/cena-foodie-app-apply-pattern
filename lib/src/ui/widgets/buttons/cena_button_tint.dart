part of '../widgets.dart';

class CenaButtonTint extends CenaButtonWidget {
  const CenaButtonTint({
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
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: CenaColors.buttonBGTint,
        );
}
