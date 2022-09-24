// ignore_for_file: constant_identifier_names

class NetworkConstants {
  const NetworkConstants._internal();

  // region response codes
  static const int response_success_ok = 200;
  static const int response_success_created = 201;
  static const int response_success_accepted = 202;
  static const int response_success_non_authoritative = 203;
  static const int response_success_no_content = 204;
  static const int response_success_reset_content = 205;
  static const int response_bad_request = 400;
  static const int response_unauthorized = 401;
  static const int response_conflict = 409;
  static const int response_internal_server_error = 500;
  static const List<int> response_success_list = [
    response_success_ok,
    response_success_created
  ];
  // endregion

  // region custom response code
  static const int response_timeout = -1;
  static const int response_internet_unavailable = -2;
  static const int response_unknown = -3;
  // endregion

  static const String success_base_response_start =
      "{    \"success\":true,    \"code\":200,    \"message\":null,    \"data\":";
  static const String success_base_response_end = " }";
}
