part of '../widgets.dart';

class CenaFieldWithLabel extends StatelessWidget {
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
  final double? width;

  // ignore: use_key_in_widget_constructors
  const CenaFieldWithLabel({
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
    this.width,
    this.onSubmitted,
    this.textInputType = TextInputType.text,
    this.validator,
    this.inputFormatters,
    this.enabled = true,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: (highlightText != "" && highlightText.isNotEmpty)
                ? RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: labelText,
                        style: labelStyle ?? CenaTextStyles.blackS14,
                      ),
                      TextSpan(
                        text: highlightText,
                        style:
                            CenaTextStyles.blackS14.copyWith(color: Colors.red),
                      )
                    ]),
                  )
                : Text(labelText, style: labelStyle ?? CenaTextStyles.blackS14),
          ),
          TextField(
            enabled: enabled,
            onSubmitted: onSubmitted,
            onChanged: onChanged,
            controller: textEditingController,
            style: textStyle ?? CenaTextStyles.blackS16,
            maxLines: 1,
            maxLength: maxLength,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              enabledBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: CenaColors.textFieldEnabledBorder),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: CenaColors.textFieldFocusedBorder),
              ),
              disabledBorder: const UnderlineInputBorder(
                borderSide:
                    BorderSide(color: CenaColors.textFieldDisabledBorder),
              ),
              fillColor: Colors.white,
              hintStyle: hintStyle ?? CenaTextStyles.greyS16,
              hintText: hintText,
              isDense: true,
              contentPadding: const EdgeInsets.only(top: 8, bottom: 8),
              suffixIcon: suffixIcon,
              suffixIconConstraints: suffixIconConstraints ??
                  const BoxConstraints(maxHeight: 32, maxWidth: 32),
              counterText: "",
            ),
            cursorColor: CenaColors.textFieldCursor,
            keyboardType: textInputType,
            inputFormatters: inputFormatters,
          ),
          textEditingController != null
              ? ValueListenableBuilder(
                  valueListenable: textEditingController!,
                  builder: (context, TextEditingValue controller, child) {
                    final isValid = validator?.call(controller.text) ?? "";
                    return Column(
                      children: [
                        const SizedBox(height: 2),
                        Text(
                          isValid,
                          style: CenaTextStyles.blackS14
                              .copyWith(color: Colors.red),
                        ),
                        const SizedBox(height: 5),
                      ],
                    );
                  },
                )
              : Container(),
        ],
      ),
    );
  }
}
