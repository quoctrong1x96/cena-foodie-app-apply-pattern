part of '../widgets.dart';

class CenaInputLabelbox extends StatelessWidget {
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

  // ignore: use_key_in_widget_constructors
  const CenaInputLabelbox({
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
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: CenaColors.WHITE,
          padding: const EdgeInsets.all(AppConstants.padding_all),
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
        Expanded(
          child: Container(
            color: CenaColors.WHITE,
            padding: const EdgeInsets.only(right: AppConstants.padding_right),
            child: TextField(
              enabled: enabled,
              textAlign: TextAlign.right,
              onSubmitted: onSubmitted,
              onChanged: onChanged,
              controller: textEditingController,
              style: textStyle ?? CenaTextStyles.blackS16,
              maxLines: 1,
              maxLength: maxLength,
              autofocus: autoFocus,
              decoration: InputDecoration(
                  border: null,
                  fillColor: CenaColors.WHITE,
                  enabledBorder: null,
                  focusedBorder: null),
              // decoration: InputDecoration(
              //   enabledBorder: UnderlineInputBorder(
              //     borderSide:
              //         BorderSide(color: AppColors.textFieldEnabledBorder),
              //   ),
              //   focusedBorder: UnderlineInputBorder(
              //     borderSide:
              //         BorderSide(color: AppColors.textFieldFocusedBorder),
              //   ),
              //   disabledBorder: UnderlineInputBorder(
              //     borderSide:
              //         BorderSide(color: AppColors.textFieldDisabledBorder),
              //   ),
              //   fillColor: Colors.white,
              //   hintStyle: hintStyle ?? AppTextStyle.greyS16,
              //   hintText: hintText,
              //   isDense: true,
              //   contentPadding: EdgeInsets.only(top: 8, bottom: 8),
              //   suffixIcon: suffixIcon,
              //   suffixIconConstraints: suffixIconConstraints ??
              //       BoxConstraints(maxHeight: 32, maxWidth: 32),
              //   counterText: "",
              // ),
              cursorColor: CenaColors.textFieldCursor,
              keyboardType: textInputType,
              inputFormatters: inputFormatters,
            ),
          ),
        ),
        // textEditingController != null
        //     ? ValueListenableBuilder(
        //         valueListenable: textEditingController!,
        //         builder: (context, TextEditingValue controller, child) {
        //           final isValid = validator?.call(controller.text) ?? "";
        //           return Column(
        //             children: [
        //               SizedBox(height: 2),
        //               Text(
        //                 isValid,
        //                 style:
        //                     AppTextStyle.blackS14.copyWith(color: Colors.red),
        //               ),
        //               SizedBox(height: 5),
        //             ],
        //           );
        //         },
        //       )
        //     : Container(),
      ],
    );
  }
}
