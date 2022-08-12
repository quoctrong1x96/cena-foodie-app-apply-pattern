// import 'dart:convert';
// import 'dart:io';

// import 'package:http/http.dart' as http;

// import '../../helpers/secure_storage.dart';
// import '../../models/response/category_all_response.dart';
// import '../../models/response/response_default.dart';
// import '../../models/response/response_login.dart';
// import '../../models/response/user_updated_response.dart';
// import '../apis/api_cenaservice.dart';
// // 
// ///
// class HttpAuthRepository {
//   HttpAuthRepository({required this.api, required this.client});
//   final CenaServiceAPI api;
//   final http.Client client;

//   ///============================[AUTHORIZATION]================================

//   ///Login to Cena Foodie with email and password of user
//   ///
//   ///[email]: Type String, is user's email
//   ///[password]: Type String, is user's password
//   ///
//   ///Return: [ResponseLogin] : has token
//   Future<ResponseLogin> authOnEmail(
//           {required String email, required String password}) async =>
//       await _postData(
//         uri: api.authOnEmail(),
//         headers: {'Accept': 'application/json'},
//         body: {'email': email, 'password': password},
//         builder: (data) => ResponseLogin.fromJson(data),
//       );

//   ///Login to Cena Foodie with phone number, after that, verify by OTP
//   ///
//   ///Phone: Type String, is user's number phone
//   ///
//   ///Return: [ResponseLogin] : has token
//   Future<ResponseLogin> authOnPhone({required String phone}) async =>
//       await _postData(
//         uri: api.authOnPhone(),
//         headers: {'Accept': 'application/json'},
//         body: {'phone': phone},
//         builder: (data) => ResponseLogin.fromJson(data),
//       );

//   ///Request Cena Service about renew token
//   ///
//   ///We get token from Phone's storage
//   ///
//   ///Return: [ResponseLogin] : has token
//   Future<ResponseLogin> authOnRenewToken() async {
//     final token = await secureStorage.readToken();
//     return await _getData(
//       uri: api.authOnRenewToken(),
//       headers: {
//         'Accept': 'application/json',
//         'xx-token': token!,
//       },
//       builder: (data) => ResponseLogin.fromJson(data),
//     );
//   }

//   ///============================[CATEGORIES]===============================

//   ///Add category for store
//   ///
//   ///[storeId]: Id of store management of category,
//   /// [name]: Category name,
//   /// [description]: Category description
//   Future<ResponseDefault> storeAddCategory({
//     required int storeId,
//     required String name,
//     required String description,
//   }) async {
//     final token = await secureStorage.readToken();
//     return await _postData(
//       uri: api.storeAddCategory(storeId: storeId),
//       headers: {
//         'Accept': 'application/json',
//         'xx-token': token!,
//       },
//       body: {
//         'category': name,
//         'description': description,
//       },
//       builder: (data) => ResponseDefault.fromJson(data),
//     );
//   }

//   ///Update category for store
//   ///
//   ///[storeId]: Id of store management of category,
//   /// [categoryId]: Id of category you wan to delete,
//   /// [name]: Category name,
//   /// [description]: Category description
//   Future<ResponseDefault> storeDeleteCategory({
//     required int storeId,
//     required int categoryId,
//     required String name,
//     required String description,
//   }) async {
//     final token = await secureStorage.readToken();
//     return await _deleteData(
//       uri: api.storeDeleteCategory(
//         storeId: storeId,
//         categoryId: categoryId,
//       ),
//       headers: {
//         'Accept': 'application/json',
//         'xx-token': token!,
//       },
//       body: {
//         'category': name,
//         'description': description,
//       },
//       builder: (data) => ResponseDefault.fromJson(data),
//     );
//   }

//   ///Update category for store
//   ///
//   ///[storeId]: Id of store management of category,
//   /// [categoryId]: Id of category you wan to update,
//   /// [name]: Category name,
//   /// [description]: Category description
//   Future<ResponseDefault> storeUpdateCategory({
//     required int storeId,
//     required int categoryId,
//     required String name,
//     required String description,
//   }) async {
//     final token = await secureStorage.readToken();
//     return await _putData(
//       uri: api.storeUpdateCategory(
//         storeId: storeId,
//         categoryId: categoryId,
//       ),
//       headers: {
//         'Accept': 'application/json',
//         'xx-token': token!,
//       },
//       body: {
//         'category': name,
//         'description': description,
//       },
//       builder: (data) => ResponseDefault.fromJson(data),
//     );
//   }

//   ///Get category by Store id and Category id
//   ///
//   ///[storeId]: Id of store management of category,
//   /// [categoryId]: Id of category you wan to update,
//   Future<Category> storeGetCategoryById({
//     required int storeId,
//     required int categoryId,
//   }) async {
//     final token = await secureStorage.readToken();
//     return await _getData(
//       uri: api.storeGetCategoryById(
//         storeId: storeId,
//         categoryId: categoryId,
//       ),
//       headers: {
//         'Accept': 'application/json',
//         'xx-token': token!,
//       },
//       builder: (data) => Category.fromJson(data),
//     );
//   }

//   ///Get all categories by Store id
//   ///
//   ///[storeId]: Id of store management of category,
//   Future<List<Category>?> storeGetAllCategories({
//     required int storeId,
//   }) async {
//     final token = await secureStorage.readToken();
//     return await _getData(
//       uri: api.storeGetAllCategories(
//         storeId: storeId,
//       ),
//       headers: {
//         'Accept': 'application/json',
//         'xx-token': token!,
//       },
//       builder: (data) => CategoryAllResponse.fromJson(data).categories,
//     );
//   }

//   ///=================================[USERS]=====================================

//   ///Get user by id
//   ///
//   ///[UserId]: Id of user
//   Future<User?> userById({
//     required int userId,
//   }) async {
//     final token = await secureStorage.readToken();

//     return await _getData(
//       uri: api.userById(
//         userId: userId,
//       ),
//       builder: (data) => ResponseLogin.fromJson(data).user,
//       headers: {
//         'Accept': 'application/json',
//         'xx-token': token!,
//       },
//     );
//   }

//   ///User Update profiles
//   ///
//   ///[UserId]: Id of user,
//   /// [firstName]: User's first name
//   /// [lastName]: User's last name
//   /// [phone]: User's phone number
//   Future<ResponseDefault> userUpdateProfiles({
//     required int userId,
//     required String firsName,
//     required String lastName,
//     required String phone,
//   }) async {
//     final token = await secureStorage.readToken();

//     return await _putData(
//         uri: api.userChangeProfiles(
//           userId: userId,
//         ),
//         builder: (data) => ResponseDefault.fromJson(data),
//         headers: {
//           'Accept': 'application/json',
//           'xx-token': token!
//         },
//         body: {
//           'firstName': firsName,
//           'lastName': lastName,
//           'phone': phone,
//         });
//   }

//   ///Get user on last update
//   ///
//   ///[UserId]: Id of user,
//   Future<UserUpdated> userGetLastUpdate({
//     required int userId,
//   }) async {
//     final token = await secureStorage.readToken();

//     return await _getData(
//       uri: api.userById(
//         userId: userId,
//       ),
//       builder: (data) => UserUpdated.fromJson(data),
//       headers: {'Accept': 'application/json', 'xx-token': token!},
//     );
//   }

//   ///Get user on last update
//   ///
//   ///[UserId]: Id of user,
//   /// [currentPassword]: Old password of user
//   /// [newPassword]: New password of user
//   Future<UserUpdated> userChangePassword({
//     required int userId,
//     required String currentPassword,
//     required String newPassword,
//   }) async {
//     final token = await secureStorage.readToken();

//     return await _patchData(
//       uri: api.userChangePassword(
//         userId: userId,
//       ),
//       builder: (data) => UserUpdated.fromJson(data),
//       headers: {
//         'Accept': 'application/json',
//         'xx-token': token!,
//       },
//       body: {
//         'currentPassword': currentPassword,
//         'newPassword': newPassword,
//       },
//     );
//   }

//   ///============================[METHOD_OF_HTTP]===============================

//   ///Get method of Http
//   Future<T> _getData<T>({
//     required Uri uri,
//     required T Function(dynamic data) builder,
//     Map<String, String>? headers,
//   }) async {
//     try {
//       final response = await client.get(
//         uri,
//         headers: headers,
//       );
//       return _responseProcess(
//         response: response,
//         builder: builder,
//       );
//     } on SocketException catch (_) {
//       throw "noInternetConnection";
//     }
//   }

//   ///Post method of Http
//   Future<T> _postData<T>({
//     required Uri uri,
//     required T Function(dynamic data) builder,
//     Object? body,
//     Map<String, String>? headers,
//   }) async {
//     try {
//       http.Response response = await client.post(
//         uri,
//         body: body,
//         headers: headers,
//       );
//       return _responseProcess(response: response, builder: builder);
//     } on SocketException catch (_) {
//       throw "noInternetConnection";
//     }
//   }

//   ///Put method of Http
//   Future<T> _putData<T>({
//     required Uri uri,
//     required T Function(dynamic data) builder,
//     Object? body,
//     Map<String, String>? headers,
//   }) async {
//     try {
//       http.Response response = await client.put(
//         uri,
//         body: body,
//         headers: headers,
//       );
//       return _responseProcess(response: response, builder: builder);
//     } on SocketException catch (_) {
//       throw "noInternetConnection";
//     }
//   }

//   ///Patch method of Http
//   Future<T> _patchData<T>({
//     required Uri uri,
//     required T Function(dynamic data) builder,
//     Object? body,
//     Map<String, String>? headers,
//   }) async {
//     try {
//       http.Response response = await client.patch(
//         uri,
//         body: body,
//         headers: headers,
//       );
//       return _responseProcess(response: response, builder: builder);
//     } on SocketException catch (_) {
//       throw "noInternetConnection";
//     }
//   }

//   ///delete method of Http
//   Future<T> _deleteData<T>({
//     required Uri uri,
//     required T Function(dynamic data) builder,
//     Object? body,
//     Map<String, String>? headers,
//   }) async {
//     try {
//       http.Response response = await client.delete(
//         uri,
//         body: body,
//         headers: headers,
//       );
//       return _responseProcess(response: response, builder: builder);
//     } on SocketException catch (_) {
//       throw "noInternetConnection";
//     }
//   }

//   ///Process of response
//   ///
//   ///1/ on error: we throw it
//   ///
//   ///2/ on success: we user model's fromJson to return data
//   Future<T> _responseProcess<T>({
//     required http.Response response,
//     required T Function(dynamic data) builder,
//   }) async {
//     switch (response.statusCode) {
//       case 200:
//         final data = json.decode(response.body);
//         return builder(data);
//       case 401:
//         throw "invalidApiKey";
//       case 404:
//         throw "notFound";
//       default:
//         throw "unknown";
//     }
//   }
// }
