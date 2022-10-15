// ignore_for_file: constant_identifier_names

class RouteConstants {
  const RouteConstants._internal();

  static const String check_login = '/check-login-page';
  static const String login = '/login';
  static const String forgot_password = '/forgot-password';
  static const String register = '/register';
  static const String enter_reference = '/register/reference';
  static const String verify_phone_number = "/verify-phone-number";
  static const String get_current_address_of_user = 'users/current-address';
  static const String change_password = '/change-password';

  static const String admin_home = '/merchan/';
  static const String admin_edit = '/merchan/edit';
  static const String admin_category = '/merchan/category';
  static const String admin_list_product = '/merchan/list-products';
  static const String admin_list_deliveries = '/merchan/list-deliveries';
  static const String admin_dashboard = '/merchan/dashboard';

  static const String delivery_home = '/delivery/';

  static const String client_home = '/client/';
  static const String client_address = '/client/addresses';
  static const String client_add_address = '/client/addresses/add';
  static const String client_profile = '/client/profile';
  static const String client_profile_edit = '/client/profile/edit';
  static const String client_profile_lastname = '/client/profile/lastname';
  static const String client_profile_firstname = '/client/profile/firstname';
  static const String client_profile_sex = '/client/profile/sex';
  static const String client_profile_birthday = '/client/profile/birthday';
  static const String client_map = '/client/map';
  static const String client_order_detail = '/client/order/detail';
  static const String client_order = '/client/order/';

  static const String order_on_way = '/order/on-way';
  static const String order_deliveried = '/order/deliveried';
  static const String order_details = '/order/details';

  static const String product_detail = '/product/detail';
  static const String search_by_category = '/search/category';
  static const String cart_client = '/cart/client';
  static const String store_order = '/store/order';

  static const String setting_change_languages = '/setting/change-languages';
  static const String select_role = '/select-role';

  static const String home = '/';
  static const String auth = '/authorize';
  static const String product_overview = '/product-list';
  static const String cart = '/cart';
  static const String orders = '/orders';
  static const String user_products = '/user-products';
  static const String manage_product = '/manage-product';
}
