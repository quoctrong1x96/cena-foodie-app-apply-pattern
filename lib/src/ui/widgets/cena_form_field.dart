part of 'widgets.dart';

class CenaFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final int maxLine;
  final FocusNode? focusNode;
  final bool readOnly;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final double? width;

  const CenaFormField(
      {Key? key,
      this.controller,
      this.hintText,
      this.focusNode,
      this.width,
      this.isPassword = false,
      this.maxLength,
      this.keyboardType = TextInputType.text,
      this.maxLine = 1,
      this.readOnly = false,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        controller: controller,
        style: GoogleFonts.getFont('Roboto', fontSize: 18),
        obscureText: isPassword,
        maxLines: maxLine,
        readOnly: readOnly,
        focusNode: focusNode,
        maxLength: maxLength,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: .5, color: Colors.grey)),
          contentPadding: const EdgeInsets.all(10.0),
          hintText: hintText,
          hintStyle: GoogleFonts.getFont('Roboto', color: Colors.grey),
        ),
        validator: validator,
      ),
    );
  }
}
