part of '../widgets.dart';

class CenaInputPhone extends CenaFieldWithLabel {
  CenaInputPhone({
    String? highlightText,
    String? labelText,
    TextStyle? labelStyle,
    TextEditingController? textEditingController,
    ValueChanged<String>? onChanged,
    bool enabled = true,
  }) : super(
          textEditingController: textEditingController,
          onChanged: onChanged,
          labelText: labelText ?? "Số điện thoại",
          labelStyle: labelStyle,
          hintText: "",
          highlightText: highlightText ?? "*",
          textInputType: TextInputType.phone,
          enabled: enabled,
          validator: (text) {
            if (CheckingUtils.isPhoneNumber(text ?? "") ||
                (text ?? "").isEmpty) {
              return "";
            } else {
              return "Số điện thoại không hợp lệ";
            }
          },
        );
}
