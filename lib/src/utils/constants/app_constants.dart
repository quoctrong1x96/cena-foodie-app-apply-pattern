// ignore_for_file: constant_identifier_names, non_constant_identifier_names
import 'package:flutter/material.dart';

class AppConstants {
  const AppConstants._internal();

  static const String companyName = "Cena";
  static const String appName = "Foodie";
  static const String fullAppName = companyName + " " + appName;

  // region map keys
  static const String key_id = 'id';
  static const String key_option = 'option';
  static const String key_phone = 'phone_number';
  static const String key_is_register_page = 'is_register_page';
  // endregion

  // region shared preferences
  static const String pref_user = 'pref_user';
  static const String pref_access_token = 'pref_access_token';
  // endregion

  // region date formats
  static const String day_format = 'd MMM, yyyy';
  static const String time_format = 'hh:mm aaa';
  // endregion

  static const double border_radius = 5.0;
  static const double color_opacity = 0.2;
  static const double textbox_opacity = 0.05;
  static const double elevation_button = 2;
  static const double button_radius = 10.0;
  static const double button_height = 45;
  static const double space_height_between_widget = 10.0;
  static const double space_height_between_group = 20.0;
  static const double space_height_between_special = 20.0;

  static const BoxShadow app_shadow = BoxShadow(
    color: Color.fromARGB(255, 173, 173, 173),
    offset: Offset(0.0, 1.0), //(x,y)
    blurRadius: 1.4,
  );
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
