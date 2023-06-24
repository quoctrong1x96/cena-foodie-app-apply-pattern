part of '../widgets.dart';

class CenaNumberField extends CenaFormField {
  const CenaNumberField({
    Key? key,
    required TextEditingController controller,
    String? hintText,
    FocusNode? focusNode,
    bool? readOnly,
    FormFieldValidator<String>? validator,
    int? maxLength,
    double? width,
  }) : super(
            key: key,
            controller: controller,
            focusNode: focusNode,
            hintText: hintText,
            isPassword: false,
            keyboardType: TextInputType.number,
            readOnly: readOnly ?? false,
            maxLength: maxLength,
            maxLine: 1,
            prefixIcon: FontAwesomeIcons.mobileScreenButton,
            validator: validator,
            width: width);
}
