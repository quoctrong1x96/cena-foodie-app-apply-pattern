// ignore_for_file: constant_identifier_names

class CenaServiceConstants {
  const CenaServiceConstants._internal();

  // region base urls / api keys
  static const String BASE_URL =
      '63cb-2402-800-6375-621e-4c08-1665-f9ae-9639.ngrok.io';
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
