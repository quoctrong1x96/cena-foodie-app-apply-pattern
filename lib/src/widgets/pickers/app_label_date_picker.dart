import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../commons/app_dialog.dart';
import '../../configs/cena_colors.dart';
import '../../configs/cena_text_styles.dart';

class DatePickerController extends ValueNotifier<DateTime?> {
  DatePickerController({DateTime? dateTime}) : super(dateTime);

  DateTime? get date => value;

  set date(DateTime? newDate) {
    value = newDate;
  }
}

class AppLabelDatePicker extends StatelessWidget {
  final DatePickerController? controller;
  final String dateFormat;
  final DateTime? minTime;
  final DateTime? maxTime;
  final ValueChanged<DateTime>? onChanged;

  final String labelText;
  final TextStyle? labelStyle;
  final String highlightText;
  final Widget? suffixIcon;
  final TextStyle? textStyle;
  final String hintText;
  final TextStyle? hintStyle;
  final bool enabled;

  const AppLabelDatePicker({
    Key? key,
    this.dateFormat = "dd/MM/yyyy",
    this.minTime,
    this.maxTime,
    this.controller,
    this.labelText = "",
    this.labelStyle,
    this.highlightText = "*",
    this.suffixIcon,
    this.textStyle,
    this.hintText = "",
    this.hintStyle,
    this.onChanged,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
              text: labelText,
              style: labelStyle ?? CenaTextStyles.blackS12,
            ),
            TextSpan(
              text: highlightText,
              style: CenaTextStyles.blackS12.copyWith(color: Colors.red),
            )
          ]),
        ),
        ValueListenableBuilder(
          valueListenable: controller!,
          child: Container(),
          builder: (context, DateTime? dateTime, child) {
            var dateString = "";
            // ignore: unnecessary_null_comparison
            if ((dateFormat != null) && (dateTime != null)) {
              dateString = DateFormat(dateFormat).format(dateTime);
            }
            return GestureDetector(
              onTap: () {
                _showDatePicker(context: context);
              },
              child: TextField(
                enabled: false,
                textInputAction: TextInputAction.search,
                controller: TextEditingController(text: dateString),
                style: textStyle ?? CenaTextStyles.blackS16,
                maxLines: 1,
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: CenaColors.textFieldEnabledBorder),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: CenaColors.textFieldFocusedBorder),
                  ),
                  disabledBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: CenaColors.textFieldDisabledBorder),
                  ),
                  fillColor: Colors.white,
                  hintStyle: hintStyle ?? CenaTextStyles.greyS16,
                  hintText: hintText,
                  isDense: true,
                  contentPadding: const EdgeInsets.only(top: 8, bottom: 12),
                  suffixIcon:
                      suffixIcon ?? const Icon(Icons.date_range_outlined),
                  suffixIconConstraints:
                      const BoxConstraints(maxHeight: 32, maxWidth: 32),
                ),
                cursorColor: CenaColors.textFieldCursor,
              ),
            );
          },
        ),
        const SizedBox(height: 22),
      ],
    );
  }

  _showDatePicker({
    BuildContext? context,
  }) {
    if (!enabled) {
      return;
    }
    if (context == null) {
      return;
    }
    AppDialog.showDatePicker(
      context,
      maxTime: maxTime,
      minTime: minTime,
      onConfirm: (dateTime) {
        onChanged?.call(dateTime);
        controller?.date = dateTime;
      },
      currentTime: controller?.date ?? DateTime.now(),
    );
  }
}
