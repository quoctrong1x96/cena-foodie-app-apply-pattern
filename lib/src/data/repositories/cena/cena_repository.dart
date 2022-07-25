import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../../../utils/constants/network_constants.dart';
import '../../../utils/log_utils.dart';
import '../../apis/api_cenaservice.dart';
import '../../app_locator.dart';
import '../../enums/network_request_type.dart';
import '../../enums/network_response_type.dart';
import '../../models/entities/address/address.dart';
import '../../models/entities/cart/cart.dart';
import '../../models/entities/category/category.dart';
import '../../models/entities/delivery/delivery.dart';
import '../../models/entities/order/order.dart';
import '../../models/entities/product/product.dart';
import '../../models/entities/product/product_image.dart';
import '../../models/entities/user/user.dart';
import '../../models/entities/user/user_request.dart';
import '../../models/networks/api_response/api_response.dart';
import '../../services/cena_service/cena_service.dart';
import '../../services/local/storage_service.dart';
import 'network_client.dart';

class CenaRepository implements ICenaService {
  final _storageService = locator<IStorageService>();

  @override
  Future<ApiResponse<Address>> addAddress({required Address address}) async {
    final token = await _storageService.getAccessToken();
    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPI.instance.authOnEmail(),
      token: token,
      body: address.toJson(),
    );
    return _getApiResponse(response, (data) {
      return data != null ? Address.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<Category>> addCategory(
      {required int storeId, required Category category}) {
    // TODO: implement addCategory
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<Order>>> addOrder(
      {required int addressId,
      required double total,
      required String typePayment,
      required List<Cart> carts}) {
    // TODO: implement addOrder
    throw UnimplementedError();
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
  Future<ApiResponse<String>> deleteAddress(
      {required int userId, required int addressId}) {
    // TODO: implement deleteAddress
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> deleteCategory(
      {required int storeId, required int categoryId}) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
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
  Future<ApiResponse<List<Order>>> fetChAllOrderByStatusForStore(
      {required int storeId, required String status}) {
    // TODO: implement fetChAllOrderByStatusForStore
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<Address>>> fetchAllAddress({required int userId}) {
    // TODO: implement fetchAllAddress
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<Order>>> fetchAllByStatusForClient(
      {required int clientId, required String status}) {
    // TODO: implement fetchAllByStatusForClient
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<Order>>> fetchAllByStatusForDelivery(
      {required int deliveryId, required String status}) {
    // TODO: implement fetchAllByStatusForDelivery
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<Category>>> fetchAllCategory({required int storeId}) {
    // TODO: implement fetchAllCategory
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<Delivery>>> fetchAllOfStore({required int storeId}) {
    // TODO: implement fetchAllOfStore
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<Product>>> fetchAllProduct({required int storeId}) {
    // TODO: implement fetchAllProduct
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<Address>> getAddressById(
      {required int userId, required int addressId}) {
    // TODO: implement getAddressById
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<Order>> getOrderDetail({required int orderId}) {
    // TODO: implement getOrderDetail
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<List<ProductImage>>> getProductImages(
      {required int storeId, required int productId}) {
    // TODO: implement getProductImages
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> getStoreAdminToken({required int storeId}) {
    // TODO: implement getStoreAdminToken
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<User>> getUserById({required int userID}) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<User>> loginWithEmail(UserRequest? userRequest) async {
    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPI.instance.authOnEmail(),
      body: userRequest?.toJson(),
    );
    return _getApiResponse<User>(response, (data) {
      return data != null ? User.fromJson(data) : null;
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
  Future<ApiResponse<User>> registerUser(
      {required User user, required String password}) {
    // TODO: implement registerUser
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<User>> renewToken(UserRequest? userRequest) async {
    final token = await _storageService.getAccessToken();
    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPI.instance.authOnEmail(),
      token: token,
      body: userRequest?.toJson(),
    );
    return _getApiResponse<User>(response, (data) {
      return data != null ? User.fromJson(data) : null;
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
  Future<ApiResponse<String>> setOrderToCancelled({required String orderId}) {
    // TODO: implement setOrderToCancelled
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> setOrderToDelivered({required String orderId}) {
    // TODO: implement setOrderToDelivered
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> setOrderToDispatch(
      {required String orderId,
      required String deliveryId,
      required int storeId,
      required String storeLat,
      required String storeLng}) {
    // TODO: implement setOrderToDispatch
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<String>> setOrderToOnWay(
      {required String orderId,
      required String desLat,
      required String desLng}) {
    // TODO: implement setOrderToOnWay
    throw UnimplementedError();
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
