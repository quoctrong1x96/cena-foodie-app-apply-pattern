import 'dart:convert';
import 'package:http/http.dart' as http;

import '../helpers/secure_storage.dart';
import '../models/response/response_default.dart';
import '../models/response/stores_list_response.dart';
import '../models/store/store_model.dart';
import '../models/store/store_response.dart';
import '../services/url.dart';

class StoreController {
  final String storeApiSource = "${URLS.URL_API}/v1/stores";
  Future<Store?> getStoreById(int storeId) async {
    final token = await secureStorage.readToken();

    final response = await http.get(Uri.parse('$storeApiSource/$storeId'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return StoreResponse.fromJson(jsonDecode(response.body)).store;
  }

  Future<Map<String, dynamic>?> getStoreNameById(int storeId) async {
    final token = await secureStorage.readToken();

    final response = await http.get(
        Uri.parse('${URLS.URL_API}/v1/stores/$storeId/name'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return jsonDecode(response.body)['data']["stores_name"][0];
  }

  Future<List<Store>> getAllStoreByPage(
      int offset, int limit, String lat, String lng) async {
    final token = await secureStorage.readToken();

    final response = await http.get(Uri.parse(storeApiSource), headers: {
      'Accept': 'application/json',
      'xx-token': token!,
      'offset': offset.toString(),
      'limit': limit.toString(),
      'lat': lat,
      'lng': lng
    });

    return StoresListResponse.fromJson(jsonDecode(response.body)).stores;
  }

  Future<ResponseDefault> changeImageStore(int storeId, String image) async {
    final token = await secureStorage.readToken();

    var request = http.MultipartRequest(
        'PATCH', Uri.parse('$storeApiSource/$storeId/image'))
      ..headers['Accept'] = 'application/json'
      ..headers['xx-token'] = token!
      ..files.add(await http.MultipartFile.fromPath('image', image));

    final response = await request.send();
    var data = await http.Response.fromStream(response);

    return ResponseDefault.fromJson(jsonDecode(data.body));
  }

  Future<ResponseDefault> changeNameOfStore(
      int storeId, String storeName) async {
    final token = await secureStorage.readToken();

    var response = await http.patch(Uri.parse('$storeApiSource/$storeId/name'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'store_name': storeName});

    return ResponseDefault.fromJson(jsonDecode(response.body));
  }

  Future<ResponseDefault> changeCategoriesStore(int storeId, int categoryId,
      String categories, String description) async {
    final token = await secureStorage.readToken();

    var response = await http.put(
        Uri.parse('$storeApiSource/$storeId/categories/$categoryId'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'categories': categories, 'description': description});

    return ResponseDefault.fromJson(jsonDecode(response.body));
  }

  Future<ResponseDefault> changeOpenAndCloseTimeStore(
      int storeId, String openTime, String closeTime) async {
    final token = await secureStorage.readToken();

    var response = await http.patch(Uri.parse('$storeApiSource/$storeId/time'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'openTime': openTime, 'closeTime': closeTime});

    return ResponseDefault.fromJson(jsonDecode(response.body));
  }

  Future<VoucherModel?> getVoucherOfStore(int storeId) async {
    final token = await secureStorage.readToken();

    var response = await http.get(Uri.parse('$storeApiSource/$storeId/voucher'),
        headers: {'Accept': 'application/json', 'xx-token': token!});
  }

  Future<ResponseDefault> registerDelivery(
      int storeId,
      String name,
      String lastName,
      String phone,
      String email,
      String password,
      String image,
      String nToken) async {
    final token = await secureStorage.readToken();

    var request = http.MultipartRequest(
        'POST', Uri.parse('$storeApiSource/$storeId/deliveries'))
      ..headers['Accept'] = 'application/json'
      ..headers['xx-token'] = token!
      ..fields['firstName'] = name
      ..fields['lastName'] = lastName
      ..fields['phone'] = phone
      ..fields['email'] = email
      ..fields['password'] = password
      ..fields['notification_token'] = nToken
      ..files.add(await http.MultipartFile.fromPath('image', image));

    final response = await request.send();
    var data = await http.Response.fromStream(response);

    return ResponseDefault.fromJson(jsonDecode(data.body));
  }
}

final storeController = StoreController();
