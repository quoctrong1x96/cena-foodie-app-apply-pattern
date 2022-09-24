part of '../widgets.dart';

class CenaInputPasswordShow extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final FocusNode? focusNode;
  final int maxLine;
  final int maxLength;
  final bool readOnly;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;

  const CenaInputPasswordShow(
      {Key? key,
      this.controller,
      this.hintText,
      this.focusNode,
      this.maxLength = 30,
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      this.maxLine = 1,
      this.readOnly = false,
      this.suffixIcon,
      this.validator})
      : super(key: key);

  @override
  State<CenaInputPasswordShow> createState() => _CenaInputPasswordShowState();
}

class _CenaInputPasswordShowState extends State<CenaInputPasswordShow> {
  var textLength = 0;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: Theme.of(context).textTheme.bodyMedium,
      obscureText: widget.isPassword,
      maxLines: widget.maxLine,
      maxLength: 25,
      focusNode: widget.focusNode,
      readOnly: widget.readOnly,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context)
              .primaryColorDark
              .withOpacity(AppConstants.textbox_opacity),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.border_radius),
              borderSide: BorderSide(
                  width: 0.0, color: Theme.of(context).primaryColorLight)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.border_radius),
              borderSide: BorderSide(
                  width: 0.0, color: Theme.of(context).primaryColorLight)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppConstants.border_radius),
              borderSide: BorderSide(
                  width: 1.0, color: Theme.of(context).primaryColor)),
          contentPadding:
              const EdgeInsets.only(left: AppConstants.padding_all10 * 2),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.getFont('Roboto', color: Colors.grey),
          suffixText:
              '${textLength.toString()}/${widget.maxLength.toString()}  ',
          counterText: "",
          suffixIcon: widget.suffixIcon),
      validator: widget.validator,
      onChanged: (value) {
        setState(() {
          textLength = value.length;
        });
      },
    );
  }
}
