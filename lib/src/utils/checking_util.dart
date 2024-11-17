import 'package:get/get.dart';

class CheckingUtils {
  ///Search
  // static bool isTextContainKeyword({String text = "", String keyword = ""}) {
  //   final newText = String.fromCharCodes(replaceCodeUnits(text.codeUnits)).toLowerCase();
  //   final newKeyword = String.fromCharCodes(replaceCodeUnits(keyword.codeUnits)).toLowerCase();
  //   final isContain = newText.contains(newKeyword);
  //   return isContain;
  // }
  //
  // static launchPhoneCall({String phone}) async {
  //   try {
  //     await launch("tel:$phone");
  //   } catch (e) {
  //     logger.e(e);
  //   }
  // }
  //
  // static launchEmail({String email}) async {
  //   try {
  //     await launch(Uri(
  //       scheme: 'mailto',
  //       path: email,
  //     ).toString());
  //   } catch (e) {
  //     logger.e(e);
  //   }
  // }

  /// Checks if string is email.
  static bool isEmail(String email) => GetUtils.isEmail(email);

  /// Checks if string is phone number.
  static bool isPhoneNumber(String phone) => GetUtils.isPhoneNumber(phone);

  /// Checks if string is URL.
  static bool isURL(String url) => GetUtils.isURL(url);
}
