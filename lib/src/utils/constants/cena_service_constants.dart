// ignore_for_file: constant_identifier_names

class CenaServiceConstants {
  const CenaServiceConstants._internal();

  // region base urls / api keys
  static const String BASE_URL =
      '297c-2402-800-6374-9e08-64e3-7e47-38c9-c345.ngrok.io';
  static const String URL_API = '$BASE_URL/api';
  static const String URL_API_PATHv1 = '/api/v1';
  static const int? URL_PORT = null;
  static const String URL_SCHEME = 'http';
  // endregion

  // region endpoints
  static const String api_group_store = 'stores';
  static const String api_group_auth = 'auth';
  static const String api_group_user = 'users';
  static const String api_group_order = 'orders';
  static const String api_group_product = 'products';
  // endregion
}
