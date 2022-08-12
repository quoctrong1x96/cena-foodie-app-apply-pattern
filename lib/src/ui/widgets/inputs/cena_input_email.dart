part of '../widgets.dart';

class CenaInputEmail extends CenaFieldWithLabel {
  CenaInputEmail({
    String? highlightText,
    TextStyle? labelStyle,
    TextStyle? textStyle,
    TextEditingController? textEditingController,
    ValueChanged<String>? onChanged,
    bool enabled = true,
  }) : super(
          textEditingController: textEditingController,
          onChanged: onChanged,
          labelText: "Email",
          labelStyle: labelStyle,
          textStyle: textStyle,
          hintText: "",
          highlightText: highlightText ?? "*",
          textInputType: TextInputType.emailAddress,
          enabled: enabled,
          validator: (text) {
            if (CheckingUtils.isEmail(text ?? "") || (text ?? "").isEmpty) {
              return "";
            } else {
              return "Email invalid";
            }
          },
        );
}
