// ignore_for_file: constant_identifier_names

class AppConstants {
  const AppConstants._internal();

  static const String companyName = "Cena";
  static const String appName = "Foodie";
  static const String fullAppName = companyName + " " + appName;

  // region map keys
  static const String key_id = 'id';
  static const String key_option = 'option';
  // endregion

  // region shared preferences
  static const String pref_user = 'pref_user';
  static const String pref_access_token = 'pref_access_token';
  // endregion

  // region date formats
  static const String day_format = 'd MMM, yyyy';
  static const String time_format = 'hh:mm aaa';
  // endregion

  //Padding
  static const double padding_left = 15.0;
  static const double padding_right = 15.0;
  static const double padding_top = 5.0;
  static const double padding_bottom = 5.0;

  static const double padding_bottomEnd = 10.0;
  static const double padding_topBegin = 20.0;

  static const double padding_all = 15;
  static const double padding_all10 = 10;
  static const double padding_all5 = 5;

  //Margin
  static const double margin_topButton = 1.0;
  static const double margin_topGroup = 10.0;
  static const double margin_bottom = 10;
  static const double margin_all = 15;
}
