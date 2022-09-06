import 'dart:async';
import 'dart:io';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:http/http.dart' as http;

import '../../../utils/constants/network_constants.dart';
import '../../../utils/json_utils.dart';
import '../../../utils/log_utils.dart';
import '../../enums/network_request_type.dart';

class NetworkClient {
  const NetworkClient._internal();

  // ignore: prefer_const_constructors
  static final NetworkClient _instance = NetworkClient._internal();

  static NetworkClient get instance => _instance;

  Future<http.Response?> request(
    NetworkRequestType requestType, {
    required Uri uri,
    String? token,
    dynamic body, //required T Function(dynamic data) builder
  }) async {
    Exception? exception;
    http.Response? response;
    // var url = '$baseUrl$endpoint';
    // if (baseUrl == NetworkConstants.base_url && (token?.isNotEmpty ?? false)) {
    //   final queryParamOperator = endpoint.contains('?') ? '&' : '?';
    //   final tokenQueryParam = 'auth=$token';
    //   url = '$baseUrl$endpoint$queryParamOperator$tokenQueryParam';
    // }
    // final uri = Uri.parse(url);
    try {
      body = JsonUtils.toJson(body);
      final headers = _getHeaders(token);
      _logRequest(
        EnumToString.convertToString(requestType),
        uri,
        token: token,
        body: body,
      );
      if (requestType == NetworkRequestType.get) {
        response = await http.get(uri, headers: headers);
      } else if (requestType == NetworkRequestType.post) {
        response = await http.post(uri, headers: headers, body: body);
      } else if (requestType == NetworkRequestType.put) {
        response = await http.put(uri, headers: headers, body: body);
      } else if (requestType == NetworkRequestType.patch) {
        response = await http.patch(uri, headers: headers, body: body);
      } else if (requestType == NetworkRequestType.delete) {
        response = await http.delete(uri, headers: headers, body: body);
      }
    } on TimeoutException catch (e) {
      exception = e;
      response = http.Response(
        "error_timeout",
        NetworkConstants.response_timeout,
      );
    } on SocketException catch (e) {
      exception = e;
      response = http.Response(
        "error_internet_unavailable",
        NetworkConstants.response_internet_unavailable,
      );
    } on Exception catch (e) {
      exception = e;
      response = http.Response(
        "error_unknown",
        NetworkConstants.response_unknown,
      );
    }
    _logResponse(
      EnumToString.convertToString(requestType),
      uri,
      response: response,
      exception: exception,
    );
    return response;
  }

  Future<http.Response?> requestMultipart(
    NetworkRequestType requestType, {
    required Uri uri,
    String? token,
    dynamic fields, //required T Function(dynamic data) builder
    required Map<String, String> filesPath,
  }) async {
    Exception? exception;
    http.Response? response;
    // var url = '$baseUrl$endpoint';
    // if (baseUrl == NetworkConstants.base_url && (token?.isNotEmpty ?? false)) {
    //   final queryParamOperator = endpoint.contains('?') ? '&' : '?';
    //   final tokenQueryParam = 'auth=$token';
    //   url = '$baseUrl$endpoint$queryParamOperator$tokenQueryParam';
    // }
    // final uri = Uri.parse(url);
    try {
      final headers = _getHeaders(token);
      final Map<String, String> fieldsMap = fields.map<String, String>((key,
              value) =>
          MapEntry<String, String>(key, value == null ? "" : value.toString()));
      _logRequest(
        EnumToString.convertToString(requestType),
        uri,
        token: token,
        body: fields,
      );

      var request = http.MultipartRequest(
          EnumToString.convertToString(requestType).toUpperCase(), uri);
      request.headers.addAll(headers);
      request.fields.addAll(fieldsMap);
      for (var key in filesPath.keys) {
        request.files
            .add(await http.MultipartFile.fromPath(key, filesPath[key]!));
      }
      final streamResponse = await request.send();
      response = await http.Response.fromStream(streamResponse);
    } on TimeoutException catch (e) {
      exception = e;
      response = http.Response(
        "error_timeout",
        NetworkConstants.response_timeout,
      );
    } on SocketException catch (e) {
      exception = e;
      response = http.Response(
        "error_internet_unavailable",
        NetworkConstants.response_internet_unavailable,
      );
    } on Exception catch (e) {
      exception = e;
      response = http.Response(
        "error_unknown",
        NetworkConstants.response_unknown,
      );
    }
    _logResponse(
      EnumToString.convertToString(requestType),
      uri,
      response: response,
      exception: exception,
    );
    return response;
  }

  Map<String, String> _getHeaders(String? token) {
    var headers = {'Content-Type': 'application/json'};
    if (token?.isNotEmpty ?? false) {
      headers = {
        'Content-Type': 'application/json',
        'xx-token': token!,
      };
    }
    return headers;
  }

  void _logRequest(
    String requestType,
    Uri uri, {
    String? token,
    dynamic body,
  }) {
    try {
      var logMap = <String, String>{};
      logMap['URL'] = uri.toString();
      logMap['Headers'] = _getHeaders(token).toString();
      if (body != null) {
        logMap['Body'] = body.toString();
      }
      LogUtils.debug(
        'NetworkRequest',
        requestType.toUpperCase(),
        logMap.toString(),
      );
    } on Exception catch (ex) {
      LogUtils.error(
        'NetworkRequest',
        requestType.toUpperCase(),
        ex.toString(),
      );
    }
  }

  void _logResponse(
    String requestType,
    Uri uri, {
    http.Response? response,
    Exception? exception,
  }) {
    try {
      var logMap = <String, String>{};
      logMap['URL'] = uri.toString();
      logMap['Response'] =
          'Status: ${response?.statusCode} - ${response?.reasonPhrase}, Body: ${response?.body}';
      if (exception != null) {
        logMap['Exception'] = exception.toString();
      }
      LogUtils.debug(
        'NetworkResponse',
        requestType.toUpperCase(),
        logMap.toString(),
      );
    } on Exception catch (ex) {
      LogUtils.error(
        'NetworkResponse',
        requestType.toUpperCase(),
        ex.toString(),
      );
    }
  }
}
