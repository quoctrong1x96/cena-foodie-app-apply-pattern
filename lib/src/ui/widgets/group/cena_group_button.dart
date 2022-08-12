// ignore_for_file: deprecated_member_use

part of '../widgets.dart';

class CenaGroupRadio extends StatelessWidget {
  final List<String> options;
  final GroupButtonController? controller;

  const CenaGroupRadio({Key? key, required this.options, this.controller})
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
        controller: controller,
        isRadio: true,
        onSelected: (index, isSelected) => debugPrint(
          '$index button is ${isSelected ? 'selected' : 'unselected'}',
        ),
        buttons: options,
        selectedButton: 1,
        mainGroupAlignment: MainGroupAlignment.start,
        selectedTextStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Color.fromARGB(255, 243, 25, 189),
        ),
        unselectedTextStyle: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: Colors.grey[600],
        ),
        selectedColor: Colors.white,
        unselectedColor: Colors.grey[300],
        selectedBorderColor: const Color.fromARGB(255, 243, 25, 189),
        unselectedBorderColor: Colors.grey[500],
        // borderRadius: BorderRadius.circular(5.0),
        selectedShadow: const <BoxShadow>[BoxShadow(color: Colors.transparent)],
        unselectedShadow: const <BoxShadow>[
          BoxShadow(color: Colors.transparent)
        ],
        buttonHeight: 30,
      ),
    );
  }
}
