import 'package:fluttertoast/fluttertoast.dart';

import '../../../utils/configs/cena_colors.dart';

void cenaToastInfo(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: CenaColors.toastInformation,
      textColor: CenaColors.DARK,
      fontSize: 16.0);
}

void cenaToastSuccess(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: CenaColors.toastSuccess.withOpacity(0.6),
      textColor: CenaColors.WHITE,
      fontSize: 16.0);
}

void cenaToastError(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: CenaColors.toastError,
      textColor: CenaColors.WHITE,
      fontSize: 16.0);
}
