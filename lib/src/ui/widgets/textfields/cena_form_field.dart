part of '../widgets.dart';

class CenaFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final double? minHeight;
  final int maxLine;
  final FocusNode? focusNode;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool readOnly;
  final FormFieldValidator<String>? validator;
  final int? maxLength;
  final double? width;

  const CenaFormField(
      {Key? key,
      required this.controller,
      this.prefixIcon,
      this.suffixIcon,
      this.hintText,
      this.focusNode,
      this.width,
      this.isPassword = false,
      this.maxLength,
      this.keyboardType = TextInputType.text,
      this.maxLine = 1,
      this.readOnly = false,
      this.minHeight,
      this.validator})
      : super(key: key);

  @override
  State<CenaFormField> createState() => _CenaFormFieldState();
}

class _CenaFormFieldState extends State<CenaFormField> {
  var textLength = 0;
  final sizeOfSuffixIcon = 25.0;
  bool fallback = false;
  String? textFallback = "";
  bool onFocus = false;
  late FocusNode focusNode;

  @override
  void initState() {
    if (widget.focusNode == null) {
      focusNode = FocusNode();
    } else {
      focusNode = widget.focusNode!;
    }
    focusNode.addListener(() {
      setState(() {
        onFocus = focusNode.hasFocus;
      });
    });
    textFallback = widget.controller.text;
    fallback = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.minHeight,
      padding: const EdgeInsets.only(top: AppConstants.padding_all5),
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
        style: Theme.of(context).textTheme.bodyMedium,
        obscureText: widget.isPassword,
        maxLines: widget.maxLine,
        readOnly: widget.readOnly,
        focusNode: focusNode,
        maxLength: widget.maxLength,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon != null
              ? Icon(widget.prefixIcon, size: 16)
              : null,
          suffixIcon: widget.suffixIcon != null
              ? Icon(widget.suffixIcon, size: 16)
              : widget.controller.text.isNotEmpty && onFocus
                  ? InkWell(
                      onTap: () => {
                            setState(() {
                              textFallback = widget.controller.text;
                              widget.controller.clear();
                              textLength = widget.controller.text.length;
                              fallback = true;
                            })
                          },
                      child: SizedBox(
                          width: sizeOfSuffixIcon,
                          height: sizeOfSuffixIcon,
                          child: Stack(
                            alignment:
                                const Alignment(0.0, 0.0), // all centered
                            children: <Widget>[
                              Container(
                                width: sizeOfSuffixIcon,
                                height: sizeOfSuffixIcon,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[300]),
                              ),
                              Icon(
                                FontAwesomeIcons.xmark,
                                size: sizeOfSuffixIcon *
                                    0.6, // 60% width for icon
                              )
                            ],
                          )))
                  : fallback && onFocus
                      ? InkWell(
                          onTap: () => {
                                widget.controller.clear(),
                                setState(() {
                                  widget.controller.text = textFallback ?? "";
                                  textFallback = "";
                                  textLength = widget.controller.text.length;
                                  fallback = false;
                                })
                              },
                          child: SizedBox(
                              width: sizeOfSuffixIcon,
                              height: sizeOfSuffixIcon,
                              child: Stack(
                                alignment:
                                    const Alignment(0.0, 0.0), // all centered
                                children: <Widget>[
                                  Container(
                                    width: sizeOfSuffixIcon,
                                    height: sizeOfSuffixIcon,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey[300]),
                                  ),
                                  Icon(
                                    FontAwesomeIcons.arrowRotateLeft,
                                    size: sizeOfSuffixIcon *
                                        0.6, // 60% width for icon
                                  )
                                ],
                              )))
                      : null,
          suffixText: widget.suffixIcon == null && onFocus
              ? '${textLength.toString()}/${widget.maxLength.toString()}  '
              : null,
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
