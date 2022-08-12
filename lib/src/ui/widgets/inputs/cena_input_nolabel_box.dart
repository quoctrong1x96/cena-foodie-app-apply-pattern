part of '../widgets.dart';

class CenaInputNoLabelBox extends StatelessWidget {
  final String labelText;
  final TextStyle? labelStyle;
  final String highlightText;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final TextEditingController? textEditingController;
  final TextStyle? textStyle;
  final String hintText;
  final TextStyle? hintStyle;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputType textInputType;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final int? maxLength;
  final bool autoFocus;
  final int maxLines;

  // ignore: use_key_in_widget_constructors
  const CenaInputNoLabelBox({
    this.labelText = "",
    this.labelStyle,
    this.highlightText = "*",
    this.suffixIcon,
    this.suffixIconConstraints,
    this.textEditingController,
    this.textStyle,
    this.hintText = "",
    this.hintStyle,
    this.onChanged,
    this.onSubmitted,
    this.textInputType = TextInputType.text,
    this.validator,
    this.inputFormatters,
    this.enabled = true,
    this.maxLength,
    this.autoFocus = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CenaColors.WHITE,
      padding: const EdgeInsets.only(
          left: AppConstants.padding_left, right: AppConstants.padding_right),
      child: TextField(
        enabled: enabled,
        textAlign: TextAlign.left,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        controller: textEditingController,
        style: textStyle ?? CenaTextStyles.blackS16,
        maxLines: maxLines,
        maxLength: maxLength,
        autofocus: autoFocus,
        cursorColor: CenaColors.textFieldCursor,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CenaColors.WHITE),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CenaColors.WHITE),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CenaColors.WHITE),
          ),
          fillColor: const Color.fromARGB(255, 2, 0, 0),
          hintStyle: hintStyle ?? CenaTextStyles.greyS16,
          hintText: hintText,
          isDense: true,
          contentPadding: const EdgeInsets.only(top: 8, bottom: 8),
          suffixIcon: suffixIcon,
          suffixIconConstraints: suffixIconConstraints ??
              const BoxConstraints(maxHeight: 32, maxWidth: 32),
          counterText: "",
        ),
      ),
    );
  }
}
