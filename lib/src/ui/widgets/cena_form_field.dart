part of 'widgets.dart';

class CenaFormField extends StatefulWidget {
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
  State<CenaFormField> createState() => _CenaFormFieldState();
}

class _CenaFormFieldState extends State<CenaFormField> {
  var textLength = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: AppConstants.padding_all5),
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
        style: Theme.of(context).textTheme.bodyMedium,
        obscureText: widget.isPassword,
        maxLines: widget.maxLine,
        readOnly: widget.readOnly,
        focusNode: widget.focusNode,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          suffixText:
              '${textLength.toString()}/${widget.maxLength.toString()}  ',
          counterText: "",
          contentPadding:
              const EdgeInsets.only(left: AppConstants.padding_all10 * 2),
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
          hintText: widget.hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .color!
                  .withOpacity(AppConstants.color_opacity)),
        ),
        validator: widget.validator,
        onChanged: (value) {
          setState(() {
            textLength = value.length;
          });
        },
      ),
    );
  }
}
