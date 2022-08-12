// ignore_for_file: deprecated_member_use

part of '../widgets.dart';

class CenaGroupMultipleCheck extends StatelessWidget {
  final List<String> options;
  final GroupButtonController? controller;
  final List<int>? checkedList;
  final bool isDisabled;

  const CenaGroupMultipleCheck(
      {Key? key,
      required this.options,
      this.controller,
      this.checkedList,
      this.isDisabled = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CenaColors.WHITE,
      padding: const EdgeInsets.only(
          left: AppConstants.padding_left,
          right: AppConstants.padding_right,
          bottom: AppConstants.padding_all5,
          top: AppConstants.padding_all5),
      child: GroupButton(
        disabledButtons: isDisabled ? [] : checkedList!,
        controller: controller,
        isRadio: false,
        onSelected: (index, isSelected) {},
        buttons: options,
        selectedButtons: checkedList,
        mainGroupAlignment: MainGroupAlignment.start,
        selectedTextStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: CenaColors.primary,
        ),
        unselectedTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: isDisabled ? CenaColors.primary : Colors.grey[600],
        ),
        selectedColor: Colors.white,
        unselectedColor: Colors.grey[300],
        selectedBorderColor: CenaColors.primary,
        unselectedBorderColor:
            isDisabled ? CenaColors.primary : Colors.grey[500],
        // borderRadius: BorderRadius.circular(5.0),
        selectedShadow: const <BoxShadow>[BoxShadow(color: Colors.transparent)],
        unselectedShadow: const <BoxShadow>[
          BoxShadow(color: Colors.transparent)
        ],
        // buttonHeight: 30,
      ),
    );
  }
}
