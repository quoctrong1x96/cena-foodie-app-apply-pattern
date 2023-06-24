// part of '../widgets.dart';

// class CenaAutoCompleteField extends StatefulWidget {
//   final TextEditingController? controller;
//   final String? hintText;
//   final bool isPassword;
//   final TextInputType keyboardType;
//   final int maxLine;
//   final FocusNode? focusNode;
//   final IconData? prefixIcon;
//   final IconData? suffixIcon;
//   final bool readOnly;
//   final FormFieldValidator<String>? validator;
//   final int? maxLength;
//   final double? width;

//   const CenaAutoCompleteField(
//       {Key? key,
//       this.controller,
//       this.prefixIcon,
//       this.suffixIcon,
//       this.hintText,
//       this.focusNode,
//       this.width,
//       this.isPassword = false,
//       this.maxLength,
//       this.keyboardType = TextInputType.text,
//       this.maxLine = 1,
//       this.readOnly = false,
//       this.validator})
//       : super(key: key);

//   @override
//   State<CenaAutoCompleteField> createState() => _CenaAutoCompleteFieldState();
// }

// class _CenaAutoCompleteFieldState extends State<CenaAutoCompleteField> {
//   final List<String> suggestons = [
//     "@gmail.com",
//     "@outlook.com",
//     "@icloud.com",
//     "@vnpt.vn",
//     "@hotmail.com",
//     "@yahoo.com"
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return TypeAheadField(
//       animationStart: 0,
//       animationDuration: Duration.zero,
//       textFieldConfiguration: TextFieldConfiguration(
//         controller: widget.controller,
//         focusNode: widget.focusNode,
//       ),
//       suggestionsBoxDecoration:
//           SuggestionsBoxDecoration(color: Colors.lightBlue[50]),
//       suggestionsCallback: (pattern) {
//         List<String> matches = <String>[];
//         for (var element in suggestons) {
//           matches.add(pattern.toLowerCase() + element);
//         }
//         return matches;
//       },
//       itemBuilder: (context, sone) {
//         return Card(
//             child: Container(
//           padding: const EdgeInsets.all(10),
//           child: Text(sone.toString()),
//         ));
//       },
//       onSuggestionSelected: (suggestion) {
//         setState(() {
//           widget.controller!.text = suggestion.toString();
//         });
//       },
//     );
//   }
// }
