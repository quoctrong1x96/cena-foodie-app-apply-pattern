part of '../widgets.dart';

class CenaEmailField extends CenaFormField {
  const CenaEmailField({
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
            keyboardType: TextInputType.emailAddress,
            readOnly: readOnly ?? false,
            maxLength: maxLength,
            maxLine: 1,
            prefixIcon: FontAwesomeIcons.envelope,
            validator: validator,
            width: width);
}
