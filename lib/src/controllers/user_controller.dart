import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helpers/secure_storage.dart';
import '../../main.dart';
import '../models/response/address_one_response.dart';
import '../models/response/addresses_response.dart';
import '../models/response/response_default.dart';
import '../models/response/response_login.dart';
import '../models/response/user_updated_response.dart';
import '../services/url.dart';

class UserController {
  Future<User?> getUserById(int userId) async {
    final token = await secureStorage.readToken();

    final response = await http.get(
        Uri.parse('${URLS.URL_API}/v1/users/$userId'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return ResponseLogin.fromJson(jsonDecode(response.body)).user;
  }

  Future<ResponseDefault> editProfile(
      int userId, String name, String lastName, String phone) async {
    final token = await secureStorage.readToken();

    final response = await http.put(
        Uri.parse('${URLS.URL_API}/v1/users/$userId'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'firstName': name, 'lastName': lastName, 'phone': phone});

    return ResponseDefault.fromJson(jsonDecode(response.body));
  }

  Future<UserUpdated> getUserUpdated(int userId) async {
    final token = await secureStorage.readToken();

    final response = await http.get(
        Uri.parse('${URLS.URL_API}/v1/users/$userId'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return UserUpdatedResponse.fromJson(jsonDecode(response.body)).user;
  }

  Future<ResponseDefault> changePassword(
      int userId, String currentPassword, String newPassword) async {
    final token = await secureStorage.readToken();

    final response = await http.put(
        Uri.parse('${URLS.URL_API}/v1/users/$userId/password'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'currentPassword': currentPassword, 'newPassword': newPassword});

    return ResponseDefault.fromJson(jsonDecode(response.body));
  }

  Future<ResponseDefault> changeImageProfile(int userId, String image) async {
    final token = await secureStorage.readToken();

    var request = http.MultipartRequest(
        'PUT', Uri.parse('${URLS.URL_API}/v1/users/$userId/image-profile'))
      ..headers['Accept'] = 'application/json'
      ..headers['xx-token'] = token!
      ..files.add(await http.MultipartFile.fromPath('image', image));

    final response = await request.send();
    var data = await http.Response.fromStream(response);

    return ResponseDefault.fromJson(jsonDecode(data.body));
  }

  Future<ResponseDefault> changeLastNameProfile(
      int userId, String lastName) async {
    final token = await secureStorage.readToken();

    var response = await http.patch(
        Uri.parse('${URLS.URL_API}/v1/users/$userId/last-name'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'lastName': lastName});

    return ResponseDefault.fromJson(jsonDecode(response.body));
  }

  Future<ResponseDefault> changeFirstNameProfile(
      int userId, String firstName) async {
    final token = await secureStorage.readToken();

    var response = await http.patch(
        Uri.parse('${URLS.URL_API}/v1/users/$userId/first-name'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'firstName': firstName});

    return ResponseDefault.fromJson(jsonDecode(response.body));
  }

  Future<ResponseDefault> changeSexProfile(int userId, String sex) async {
    final token = await secureStorage.readToken();

    var response = await http.patch(
        Uri.parse('${URLS.URL_API}/v1/users/$userId/sex'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'sex': sex});

    return ResponseDefault.fromJson(jsonDecode(response.body));
  }

  Future<ResponseDefault> changeDateOfBirthProfile(
      int userId, String dateOfBirth) async {
    final token = await secureStorage.readToken();

    var response = await http.patch(
        Uri.parse('${URLS.URL_API}/v1/users/$userId/date-of-birth'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'dateOfBirth': dateOfBirth});

    return ResponseDefault.fromJson(jsonDecode(response.body));
  }

  Future<ResponseDefault> changeWork(int userId, String work) async {
    final token = await secureStorage.readToken();

    var response = await http.patch(
        Uri.parse('${URLS.URL_API}/v1/users/$userId/work'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'work': work});

    return ResponseDefault.fromJson(jsonDecode(response.body));
  }

  Future<ResponseDefault> registerClient(
      String name,
      String lastName,
      String phone,
      String image,
      String email,
      String password,
      String nToken) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('${URLS.URL_API}/v1/users'))
          ..headers['Accept'] = 'application/json'
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

  Future<List<ListAddress>?> getAddresses(int userId) async {
    final token = await secureStorage.readToken();

    final response = await http.get(
        Uri.parse('${URLS.URL_API}/v1/users/$userId/addresses'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return AddressesResponse.fromJson(jsonDecode(response.body)).listAddresses;
  }

  Future<ResponseDefault> deleteStreetAddress(
      int userId, String idAddress) async {
    final token = await secureStorage.readToken();

    final resp = await http.delete(
        Uri.parse('${URLS.URL_API}/v1/users/$userId/addresses/' + idAddress),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }

  Future<ResponseDefault> addNewAddressLocation(
      int userId,
      String typeAddress,
      String receiver,
      String phone,
      String building,
      String door,
      String note,
      String addressDetail,
      String latitude,
      String longitude) async {
    final token = await secureStorage.readToken();

    final resp = await http.post(
        Uri.parse('${URLS.URL_API}/v1/users/$userId/addresses'),
        headers: {
          'Accept': 'application/json',
          'xx-token': token!
        },
        body: {
          'type': typeAddress,
          'receiver': receiver,
          'phone': phone,
          'building': building,
          'door': door,
          'note': note,
          'address': addressDetail,
          'latitude': latitude,
          'longitude': longitude
        });

    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }

  Future<AddressOneResponse> getAddressOne(int userId) async {
    final token = await secureStorage.readToken();

    final resp = await http.get(
        Uri.parse('${URLS.URL_API}/v1/users/$userId/first'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return AddressOneResponse.fromJson(jsonDecode(resp.body));
  }

  Future<Address?> getAddressById(int userId, int addressId) async {
    final token = await secureStorage.readToken();

    final resp = await http.get(
        Uri.parse('${URLS.URL_API}/v1/users/$userId/addresses/$addressId'),
        headers: {'Accept': 'application/json', 'xx-token': token!});
    return AddressOneResponse.fromJson(jsonDecode(resp.body)).address;
  }

  Future<ResponseDefault> updateNotificationToken(int userId) async {
    final token = await secureStorage.readToken();
    final nToken = await pushNotification.getNotificationToken();

    final resp = await http.put(
        Uri.parse('${URLS.URL_API}/v1/users/$userId/notification-token'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'nToken': nToken});

    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }

  Future<List<Map<String, dynamic>>> getAdminsNotificationToken(
      int storeId) async {
    final token = await secureStorage.readToken();

    final resp = await http.get(
        Uri.parse('${URLS.URL_API}/v1/users/admins-notification-token'),
        headers: {
          'Accept': 'application/json',
          'xx-token': token!,
          'store_id': storeId.toString()
        });

    return List<Map<String, dynamic>>.from(jsonDecode(resp.body));
  }

  Future<ResponseDefault> updateDeliveryToClient(String idPerson) async {
    final token = await secureStorage.readToken();

    final resp = await http.put(
      Uri.parse(
          '${URLS.URL_API}/v1/users/update-delivery-to-client/' + idPerson),
      headers: {'Accept': 'application/json', 'xx-token': token!},
    );

    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }

  Future<ResponseDefault> enterReferenceCode(
      int userId, String referCode) async {
    final token = await secureStorage.readToken();

    final resp = await http.patch(
        Uri.parse('${URLS.URL_API}/v1/users/$userId/reference'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'code': referCode});

    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }
}

final userController = UserController();
