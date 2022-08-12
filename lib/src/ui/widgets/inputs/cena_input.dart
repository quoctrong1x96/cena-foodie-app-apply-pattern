part of '../widgets.dart';

class CenaInputNormal extends CenaFieldWithLabel {
  CenaInputNormal(
      {String labelText = "Text filed",
      String highlightText = "",
      TextStyle? labelStyle,
      TextStyle? textStyle,
      TextEditingController? textEditingController,
      ValueChanged<String>? onChanged,
      bool enabled = true,
      double? width,
      String? warningText})
      : super(
          textEditingController: textEditingController,
          onChanged: onChanged,
          labelText: labelText,
          labelStyle: labelStyle,
          textStyle: textStyle,
          width: width ?? double.infinity,
          hintText: "",
          highlightText: highlightText,
          textInputType: TextInputType.name,
          enabled: enabled,
          suffixIcon: const Icon(Icons.edit),
          validator: (text) {
            if (((highlightText == "") && (text ?? "").isEmpty) ||
                (text ?? "").isNotEmpty) {
              return null;
            } else {
              return warningText;
            }
          },
        );
}
