import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helpers/secure_storage.dart';
import '../models/response/response_login.dart';
import '../services/url.dart';

class AuthController {
  Future<ResponseLogin> loginController(String email, String password) async {
    final response = await http.post(
        Uri.parse('${URLS.URL_API}/v1/auth/login-email'),
        headers: {'Accept': 'application/json'},
        body: {'email': email, 'password': password});

    return ResponseLogin.fromJson(jsonDecode(response.body));
  }

  Future<ResponseLogin> loginWithPhoneController(String phone) async {
    final response = await http.post(
        Uri.parse('${URLS.URL_API}/v1/auth/login-phone'),
        headers: {'Accept': 'application/json'},
        body: {'phone': phone});

    return ResponseLogin.fromJson(jsonDecode(response.body));
  }

  Future<ResponseLogin> renewLoginController() async {
    final token = await secureStorage.readToken();
    final response = await http.get(
        Uri.parse('${URLS.URL_API}/v1/auth/renew-token-login'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return ResponseLogin.fromJson(jsonDecode(response.body));
  }
}

final authController = AuthController();
