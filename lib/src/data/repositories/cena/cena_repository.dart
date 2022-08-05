import 'package:cenafoodie/src/data/models/entities/order/order_request_add.dart';
import 'package:cenafoodie/src/data/models/entities/product/product_response.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../utils/constants/network_constants.dart';
import '../../../utils/log_utils.dart';
import '../../apis/api_cenaservice.dart';
import '../../app_locator.dart';
import '../../enums/network_request_type.dart';
import '../../enums/network_response_type.dart';
import '../../models/entities/address/address.dart';
import '../../models/entities/auth/auth_response.dart';
import '../../models/entities/category/category.dart';
import '../../models/entities/category/category_response.dart';
import '../../models/entities/delivery/delivery.dart';
import '../../models/entities/order/order.dart';
import '../../models/entities/order/order_response.dart';
import '../../models/entities/product/product.dart';
import '../../models/entities/product/product_image.dart';
import '../../models/entities/product/product_image_response.dart';
import '../../models/entities/user/user.dart';
import '../../models/entities/user/user_request.dart';
import '../../models/networks/api_response/api_response.dart';
import '../../services/cena/cena_service.dart';
import '../../services/local/storage_service.dart';
import 'network_client.dart';

class CenaRepository implements ICenaService {
  final _storageService = locator<IStorageService>();

  @override
  Future<ApiResponse<Address>> addAddress({
    required int userId,
    required Address address,
  }) async {
    final token = await _storageService.getAccessToken();
    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPI.instance.userAddAddresses(userId: userId),
      token: token,
      body: address.toJson(),
    );
    return _getApiResponse(response, (data) {
      return data != null ? Address.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<Category>> addCategory(
      {required Category category}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPI.instance.storeAddCategory(storeId: category.storeId),
      token: token,
      body: category.toJson(),
    );
    return _getApiResponse(response, (data) {
      return data != null ? Category.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<List<Order>>> addOrder(
      {required OrderRequestAdd orderRequestAdd}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPI.instance.orderAdd(),
      token: token,
      body: orderRequestAdd.toJson(),
    );
    return _getApiResponse(response, (data) {
      return data != null ? OrderFetchResponse.fromJson(data).orders : null;
    });
  }

  @override
  Future<ApiResponse<String>> addProduct(
      {required int storeId,
      required String name,
      required String description,
      required String price,
      required List<XFile> images,
      required String category}) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> changeUserDateOfBirth(
      {required int userId, required DateTime dateOfBirth}) {
    // TODO: implement changeUserDateOfBirth
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> changeUserFirstName(
      {required int userId, required String lastName}) {
    // TODO: implement changeUserFirstName
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> changeUserImage(
      {required int userId, required String imageUrl}) {
    // TODO: implement changeUserImage
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> changeUserLastName(
      {required int userId, required String lastName}) {
    // TODO: implement changeUserLastName
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> changeUserPassword(
      {required int userId,
      required String oldPassword,
      required newPassword}) {
    // TODO: implement changeUserPassword
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> changeUserProfile({required User user}) {
    // TODO: implement changeUserProfile
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> changeUserSex(
      {required int userId, required String sexType}) {
    // TODO: implement changeUserSex
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> changeUserWork(
      {required int userId, required String work}) {
    // TODO: implement changeUserWork
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<Delivery>> convertToClient({required int deliveryId}) {
    // TODO: implement convertToClient
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> deleteAddress({
    required int userId,
    required int addressId,
  }) async {
    final token = await _storageService.getAccessToken();
    final response = await NetworkClient.instance.request(
      NetworkRequestType.delete,
      uri: CenaServiceAPI.instance
          .userDeleteAddress(userId: userId, addressId: addressId),
      token: token,
    );
    return _getApiResponse(response, (data) {
      return data != null ? "Success" : null;
    });
  }

  @override
  Future<ApiResponse<String>> deleteCategory({
    required int storeId,
    required int categoryId,
  }) async {
    final token = await _storageService.getAccessToken();
    final response = await NetworkClient.instance.request(
      NetworkRequestType.delete,
      uri: CenaServiceAPI.instance
          .storeDeleteCategory(storeId: storeId, categoryId: categoryId),
      token: token,
    );
    return _getApiResponse(response, (data) {
      return data != null ? "Success" : null;
    });
  }

  @override
  Future<ApiResponse<String>> deleteProduct(
      {required int storeId, required int productId}) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> enterReferenceCodeOfUser(
      {required User user, required String code}) {
    // TODO: implement enterReferenceCodeOfUser
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<Order>>> fetChAllOrderByStatusForStore({
    required int storeId,
    required String status,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPI.instance.orderGet(
        status: status,
        typeObject: "store",
        objectId: storeId,
      ),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null ? OrderFetchResponse.fromJson(data).orders : null;
    });
  }

  @override
  Future<ApiResponse<List<Address>>> fetchAllAddress({
    required int userId,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPI.instance.userGetAllAddresses(userId: userId),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null ? Address.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<List<Order>>> fetchAllByStatusForClient({
    required int clientId,
    required String status,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPI.instance.orderGet(
        status: status,
        typeObject: "client",
        objectId: clientId,
      ),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null ? OrderFetchResponse.fromJson(data).orders : null;
    });
  }

  @override
  Future<ApiResponse<List<Order>>> fetchAllByStatusForDelivery({
    required int deliveryId,
    required String status,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPI.instance.orderGet(
        status: status,
        typeObject: "delivery",
        objectId: deliveryId,
      ),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null ? OrderFetchResponse.fromJson(data).orders : null;
    });
  }

  @override
  Future<ApiResponse<List<Category>>> fetchAllCategory({
    required int storeId,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPI.instance.storeAddCategory(
        storeId: storeId,
      ),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null
          ? CategoryFetchResponse.fromJson(data).categories
          : null;
    });
  }

  @override
  Future<ApiResponse<List<Delivery>>> fetchAllOfStore({required int storeId}) {
    // TODO: implement fetchAllOfStore
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<Product>>> fetchAllProduct({
    required int storeId,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPI.instance.productGetAllForStore(
        storeId: storeId,
      ),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null ? ProductFetchResponse.fromJson(data).products : null;
    });
  }

  @override
  Future<ApiResponse<Address>> getAddressById({
    required int userId,
    required int addressId,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPI.instance.userGetAddressById(
        userId: userId,
        addressId: addressId,
      ),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null ? Address.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<Order>> getOrderDetail({
    required int orderId,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPI.instance.orderById(
        orderId: orderId,
      ),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null ? Order.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<List<ProductImage>>> getProductImages({
    required int storeId,
    required int productId,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPI.instance
          .productGetImages(storeId: storeId, productId: productId),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null ? ImagesProductsResponse.fromJson(data).images : null;
    });
  }

  @override
  Future<ApiResponse<String>> getStoreAdminToken({required int storeId}) {
    // TODO: implement getStoreAdminToken
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<User>> getUserById({
    required int userID,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPI.instance.userById(userId: userID),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null ? User.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<AuthResponse>> loginWithEmail(
      UserRequest? userRequest) async {
    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPI.instance.authOnEmail(),
      body: userRequest?.toJson(),
    );
    return _getApiResponse<AuthResponse>(response, (data) {
      return data != null ? AuthResponse.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<User>> loginWithPhone(UserRequest? userRequest) async {
    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPI.instance.authOnPhone(),
      body: userRequest?.toJson(),
    );
    return _getApiResponse<User>(response, (data) {
      return data != null ? User.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<User>> registerUser({
    required User user,
    required String password,
  }) async {
    final token = await _storageService.getAccessToken();
    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPI.instance.authOnEmail(),
      token: token,
      body: user.toJson(),
    );
    return _getApiResponse<User>(response, (data) {
      return data != null ? User.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<AuthResponse>> renewToken() async {
    final token = await _storageService.getAccessToken();
    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPI.instance.authOnEmail(),
      token: token,
    );
    return _getApiResponse<AuthResponse>(response, (data) {
      return data != null ? AuthResponse.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<void>> searchProductByCategory(
      {required String categoryName}) {
    // TODO: implement searchProductByCategory
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<void>> searchProductByName({required String productName}) {
    // TODO: implement searchProductByName
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> setOrderToCancelled({
    required String orderId,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.patch,
      uri: CenaServiceAPI.instance.orderToCancelled(
        orderId: int.parse(orderId),
      ),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null ? Order.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<String>> setOrderToDelivered({
    required String orderId,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.patch,
      uri: CenaServiceAPI.instance.orderToDelivered(
        orderId: int.parse(orderId),
      ),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null ? Order.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<String>> setOrderToDispatch({
    required String orderId,
    required String deliveryId,
    required int storeId,
    required String storeLat,
    required String storeLng,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.patch,
      uri: CenaServiceAPI.instance.orderToDispatch(
        orderId: int.parse(orderId),
      ),
      token: token,
      body: {
        'idDelivery': deliveryId,
        'store_id': storeId.toString(),
        'store_latitude': storeLat,
        'store_longitude': storeLng,
      },
    );
    return _getApiResponse(response, (data) {
      return data != null ? Order.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<String>> setOrderToOnWay({
    required String orderId,
    required String desLat,
    required String desLng,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.patch,
      uri: CenaServiceAPI.instance.orderToOnWay(
        orderId: int.parse(orderId),
      ),
      token: token,
      body: {
        'latitude': desLat,
        'longitude': desLng,
      },
    );
    return _getApiResponse(response, (data) {
      return data != null ? Order.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<String>> updateCategory(
      {required int storeId, required Category category}) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> updateProduct(
      {required int storeId,
      required int productId,
      required String name,
      required String description,
      required String price,
      required List<XFile> images,
      required String category}) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> updateProductStatus(
      {required int storeId, required int productId, required String status}) {
    // TODO: implement updateProductStatus
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> updateUserNotifyToken(
      {required User user, required String password}) {
    // TODO: implement updateUserNotifyToken
    throw UnimplementedError();
  }

  ApiResponse<T> _getApiResponse<T>(
    http.Response? response,
    Function(dynamic data) create,
  ) {
    try {
      final type = _getNetworkResponseType(response);
      final body = response?.body;
      if (type == NetworkResponseType.success) {
        return ApiResponse.fromRawJson(
          _getNetworkResponseBody(body),
          (data) => create(data),
        );
      } else if (type == NetworkResponseType.badRequest) {
        return ApiResponse(
          message: 'error_bad_request',
          code: NetworkConstants.response_bad_request,
        );
      } else if (type == NetworkResponseType.unauthorized) {
        return ApiResponse(
          message: 'error_session_expire',
          code: NetworkConstants.response_unauthorized,
        );
      }
      return ApiResponse(message: body ?? 'error_unknown');
    } catch (e) {
      LogUtils.error('NetworkRepository', '_getApiResponse<T>', e.toString());
      return ApiResponse(message: 'error_unknown');
    }
  }

  NetworkResponseType _getNetworkResponseType(http.Response? response) {
    final status = response?.statusCode;
    if (NetworkConstants.response_success_list.contains(status)) {
      return NetworkResponseType.success;
    } else if (status == NetworkConstants.response_bad_request) {
      return NetworkResponseType.badRequest;
    } else if (status == NetworkConstants.response_unauthorized) {
      return NetworkResponseType.unauthorized;
    } else {
      return NetworkResponseType.unknown;
    }
  }

  String _getNetworkResponseBody(String? body) {
    return '${NetworkConstants.success_base_response_start}'
        '${body ?? ''}'
        '${NetworkConstants.success_base_response_end}';
  }
}
