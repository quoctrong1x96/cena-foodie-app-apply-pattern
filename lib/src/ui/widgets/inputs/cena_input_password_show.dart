part of '../widgets.dart';

class CenaInputPasswordShow extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final int maxLine;
  final bool readOnly;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;

  const CenaInputPasswordShow(
      {Key? key,
      this.controller,
      this.hintText,
      this.focusNode,
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      this.maxLine = 1,
      this.readOnly = false,
      this.suffixIcon,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.getFont('Roboto', fontSize: 18),
      obscureText: isPassword,
      maxLines: maxLine,
      maxLength: 25,
      focusNode: focusNode,
      readOnly: readOnly,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: .5, color: Colors.grey)),
          contentPadding: const EdgeInsets.only(left: 15.0),
          hintText: hintText,
          hintStyle: GoogleFonts.getFont('Roboto', color: Colors.grey),
          suffixIcon: suffixIcon),
      validator: validator,
    );
  }
}
