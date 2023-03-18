import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../utils/constants/network_constants.dart';
import '../../../utils/log_utils.dart';
import '../../apis/api_cenaservice.dart';
import '../../app_locator.dart';
import '../../enums/network_request_type.dart';
import '../../enums/network_response_type.dart';
import '../../models/entities/address/address.dart';
import '../../models/entities/address/address_response.dart';
import '../../models/entities/auth/auth_response.dart';
import '../../models/entities/category/category.dart';
import '../../models/entities/category/category_response.dart';
import '../../models/entities/delivery/delivery.dart';
import '../../models/entities/delivery/delivery_response.dart';
import '../../models/entities/order/order.dart';
import '../../models/entities/order/order_detail.dart';
import '../../models/entities/order/order_detail_response.dart';
import '../../models/entities/order/order_request_add.dart';
import '../../models/entities/order/order_response.dart';
import '../../models/entities/product/product.dart';
import '../../models/entities/product/product_image.dart';
import '../../models/entities/product/product_image_response.dart';
import '../../models/entities/product/product_response.dart';
import '../../models/entities/store/store.dart';
import '../../models/entities/store/stores_response.dart';
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
      uri: CenaServiceAPIv1.instance.userAddAddresses(userId: userId),
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
      uri:
          CenaServiceAPIv1.instance.storeAddCategory(storeId: category.storeId),
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
      uri: CenaServiceAPIv1.instance.orderAdd(),
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
      required List<String> images,
      required String category}) async {
    final token = await _storageService.getAccessToken();
    final response = await NetworkClient.instance.requestMultipart(
        NetworkRequestType.post,
        uri: CenaServiceAPIv1.instance.productAdd(storeId: storeId),
        token: token,
        fields: {
          'name': name,
          'description': description,
          'price': price,
          'category': category,
        },
        filesPath: {
          'image': images[0]
        });
    return _getApiResponse(response, (data) {
      return data != null ? data['message'] : null;
    });
  }

  @override
  Future<ApiResponse<String>> changeUserDateOfBirth(
      {required int userId, required DateTime dateOfBirth}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPIv1.instance
          .userChangeProfilesDateOfBirth(userId: userId),
      token: token,
      body: {'dateOfBirth': dateOfBirth},
    );
    return _getApiResponse(response, (data) {
      return data != null ? Category.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<String>> changeUserFirstName(
      {required int userId, required String firstName}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.patch,
      uri:
          CenaServiceAPIv1.instance.userChangeProfilesFirstName(userId: userId),
      token: token,
      body: {'firstName': firstName},
    );
    return _getApiResponse(response, (data) {
      return data['data'];
    });
  }

  @override
  Future<ApiResponse<String>> changeUserImage(
      {required int userId, required String image}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.requestMultipart(
        NetworkRequestType.put,
        uri: CenaServiceAPIv1.instance.userChangeProfilesImages(userId: userId),
        fields: {"token": token},
        token: token,
        filesPath: {'image': image});
    return _getApiResponse(response, (data) {
      return data['data'];
    });
  }

  @override
  Future<ApiResponse<String>> changeUserLastName(
      {required int userId, required String lastName}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
        NetworkRequestType.patch,
        uri: CenaServiceAPIv1.instance
            .userChangeProfilesLastName(userId: userId),
        token: token,
        body: {'lastName': lastName});
    return _getApiResponse(response, (data) {
      return data['data'];
    });
  }

  @override
  Future<ApiResponse<String>> changeUserPassword(
      {required int userId,
      required String oldPassword,
      required newPassword}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.put,
      uri: CenaServiceAPIv1.instance.userChangePassword(userId: userId),
      token: token,
      body: {'currentPassword': oldPassword, 'newPassword': newPassword},
    );
    return _getApiResponse(response, (data) {
      return data != null ? data['message'] : null;
    });
  }

  @override
  Future<ApiResponse<String>> changeUserProfile({required User user}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPIv1.instance.userChangeProfiles(userId: user.id),
      token: token,
      body: user.toJson(),
    );
    return _getApiResponse(response, (data) {
      return data != null ? Category.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<String>> changeUserSex(
      {required int userId, required String sexType}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPIv1.instance.userChangeProfilesSex(userId: userId),
      token: token,
      body: {'sex': sexType},
    );
    return _getApiResponse(response, (data) {
      return data != null ? Category.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<String>> changeUserWork(
      {required int userId, required String work}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPIv1.instance.userChangeProfilesWork(userId: userId),
      token: token,
      body: {'work': work},
    );
    return _getApiResponse(response, (data) {
      return data != null ? Category.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<Delivery>> convertDeliveryToClient(
      {required int deliveryId}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
        NetworkRequestType.put,
        uri: CenaServiceAPIv1.instance.userFromDelivery(deliveryId: deliveryId),
        token: token);
    return _getApiResponse(response, (data) {
      return data != null ? Category.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<String>> deleteAddress({
    required int userId,
    required int addressId,
  }) async {
    final token = await _storageService.getAccessToken();
    final response = await NetworkClient.instance.request(
      NetworkRequestType.delete,
      uri: CenaServiceAPIv1.instance
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
      uri: CenaServiceAPIv1.instance
          .storeDeleteCategory(storeId: storeId, categoryId: categoryId),
      token: token,
    );
    return _getApiResponse(response, (data) {
      return data != null ? "Success" : null;
    });
  }

  @override
  Future<ApiResponse<String>> deleteProduct(
      {required int storeId, required int productId}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.delete,
      uri: CenaServiceAPIv1.instance
          .productDelete(storeId: storeId, productId: productId),
      token: token,
    );
    return _getApiResponse(response, (data) {
      return data != null ? Category.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<String>> enterReferenceCodeOfUser(
      {required int userId, required String code}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
        NetworkRequestType.patch,
        uri: CenaServiceAPIv1.instance.userEnterReferenceCode(userId: userId),
        token: token,
        body: {'code': code});
    return _getApiResponse(response, (data) {
      return data != null ? data['message'] : null;
    });
  }

  @override
  Future<ApiResponse<List<Order>>> fetChAllOrderByStatusForStore({
    required int storeId,
    required String status,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPIv1.instance.orderGet(
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
  Future<ApiResponse<List<Address>?>> fetchAllAddress({
    required int userId,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPIv1.instance.userGetAllAddresses(userId: userId),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null
          ? AddressFetchResponse.fromJson(data).addresses
          : null;
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
      uri: CenaServiceAPIv1.instance.orderGetByClient(
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
      uri: CenaServiceAPIv1.instance.orderGet(
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
      uri: CenaServiceAPIv1.instance.storeGetAllCategories(
        storeId: storeId,
      ),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null
          ? CategoryFetchResponse.fromJson(data['categories']).categories
          : null;
    });
  }

  @override
  Future<ApiResponse<List<Delivery>?>> fetchAllDeliveryOfStore(
      {required int storeId}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPIv1.instance.storeFetchAllDelivery(storeId: storeId),
      token: token,
    );
    return _getApiResponse(response, (data) {
      return data != null
          ? DeliveryFetchResponse.fromJson(data).deliveries
          : null;
    });
  }

  @override
  Future<ApiResponse<List<Product>>> fetchAllProduct({
    required int storeId,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPIv1.instance.productGetAllForStore(
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
      uri: CenaServiceAPIv1.instance.userGetAddressById(
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
  Future<ApiResponse<List<OrderDetail>>> getOrderDetail({
    required int orderId,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPIv1.instance.orderById(
        orderId: orderId,
      ),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null ? OrderDetailResponse.fromJson(data).orders : null;
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
      uri: CenaServiceAPIv1.instance
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
      uri: CenaServiceAPIv1.instance.userById(userId: userID),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      return data != null ? User.fromJson(data['users']) : null;
    });
  }

  @override
  Future<ApiResponse<AuthResponse>> loginWithEmail(
      UserRequest? userRequest) async {
    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPIv1.instance.authOnEmail(),
      body: userRequest?.toJson(),
    );
    return _getApiResponse<AuthResponse>(response, (data) {
      return data != null ? AuthResponse.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<AuthResponse>> loginWithPhone(
      UserRequest? userRequest) async {
    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPIv1.instance.authOnPhone(),
      body: userRequest?.toJson(),
    );
    return _getApiResponse<AuthResponse>(response, (data) {
      return data != null ? AuthResponse.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<User>> registerUser({
    required User user,
    required String password,
  }) async {
    final response = await NetworkClient.instance.requestMultipart(
        NetworkRequestType.post,
        uri: CenaServiceAPIv1.instance.userOnAdd(),
        fields: user.toJson()..addAll({"password": password}),
        filesPath: {'image': user.image});
    return _getApiResponse<User>(response, (data) {
      return data != null ? User.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<AuthResponse>> renewToken() async {
    final token = await _storageService.getAccessToken();
    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPIv1.instance.authOnRenewToken(),
      token: token,
    );
    return _getApiResponse<AuthResponse>(response, (data) {
      return data != null ? AuthResponse.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<void>> searchProductByCategory(
      {required String categoryName}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPIv1.instance
          .productSearchByCategory(categoryName: categoryName),
      token: token,
    );
    return _getApiResponse(response, (data) {
      return data != null ? Category.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<void>> searchProductByName(
      {required String productName}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPIv1.instance
          .productSearchByName(productName: productName),
      token: token,
    );
    return _getApiResponse(response, (data) {
      return data != null ? Category.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<String>> setOrderToCancelled({
    required String orderId,
  }) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.patch,
      uri: CenaServiceAPIv1.instance.orderToCancelled(
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
      uri: CenaServiceAPIv1.instance.orderToDelivered(
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
      NetworkRequestType.put,
      uri: CenaServiceAPIv1.instance.orderToDispatch(
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
      return data != null ? data['message'] : null;
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
      uri: CenaServiceAPIv1.instance.orderToOnWay(
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
      {required Category category}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.put,
      uri: CenaServiceAPIv1.instance.storeUpdateCategory(
          storeId: category.storeId, categoryId: category.id),
      token: token,
      body: category.toJson(),
    );
    return _getApiResponse(response, (data) {
      return data != null ? data['message'] : null;
    });
  }

  @override
  Future<ApiResponse<String>> updateProduct(
      {required int storeId,
      required int productId,
      required String name,
      required String description,
      required String price,
      required List<String> images,
      required String category}) async {
    final token = await _storageService.getAccessToken();
    if (images.isNotEmpty) {
      final response = await NetworkClient.instance.requestMultipart(
          NetworkRequestType.put,
          uri: CenaServiceAPIv1.instance
              .productUpdate(orderId: storeId, productId: productId),
          token: token,
          fields: {
            'name': name,
            'description': description,
            'price': price,
            'category': category
          },
          filesPath: {
            'image': images[0]
          });
      return _getApiResponse(response, (data) {
        return data != null ? data['message'] : null;
      });
    } else {
      final response = await NetworkClient.instance.request(
        NetworkRequestType.put,
        uri: CenaServiceAPIv1.instance
            .productUpdate(orderId: storeId, productId: productId),
        token: token,
        body: {
          'name': name,
          'description': description,
          'price': price,
          'category': category
        },
      );
      return _getApiResponse(response, (data) {
        return data != null ? data['message'] : null;
      });
    }
  }

  @override
  Future<ApiResponse<String>> updateProductStatus(
      {required int storeId,
      required int productId,
      required String status}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.patch,
      uri: CenaServiceAPIv1.instance
          .productUpdateStatus(storeId: storeId, productId: productId),
      token: token,
      body: {'status': status},
    );
    return _getApiResponse(response, (data) {
      return data != null ? data['message'] : null;
    });
  }

  @override
  Future<ApiResponse<String>> updateUserNotifyToken(
      {required int userId, required String notifyToken}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.put,
      uri:
          CenaServiceAPIv1.instance.userUpdateNotificationToken(userId: userId),
      token: token,
      body: {'notification_token': notifyToken},
    );
    return _getApiResponse(response, (data) {
      return data != null ? data['message'] : null;
    });
  }

  ApiResponse<T> _getApiResponse<T>(
    http.Response? response,
    Function(dynamic data) create,
  ) {
    try {
      final type = _getNetworkResponseType(response);
      final bodyJson =
          jsonDecode(response?.body == "" ? '{}' : response?.body ?? '{}');
      final body = response?.body.replaceAll('\\', '');
      if (type == NetworkResponseType.success_200) {
        return ApiResponse.fromRawJson(
          _getNetworkResponseBody(body),
          (data) => create(data),
        );
      } else if (type == NetworkResponseType.badRequest_400) {
        return ApiResponse(
          message: bodyJson['message'] ?? 'error_bad_request',
          code: NetworkConstants.response_bad_request,
        );
      } else if (type == NetworkResponseType.notFound_404) {
        return ApiResponse(
          message: bodyJson['message'] ?? 'error_not_found',
          code: NetworkConstants.response_not_found,
        );
      } else if (type == NetworkResponseType.unauthorized_401) {
        return ApiResponse(
          message: bodyJson['message'] ?? 'error_session_expire',
          code: NetworkConstants.response_unauthorized,
        );
      } else if (type == NetworkResponseType.conflict_409) {
        return ApiResponse(
          message: bodyJson['message'],
          code: NetworkConstants.response_conflict,
        );
      } else if (type == NetworkResponseType.serverInternalError_500) {
        return ApiResponse(
          message: "error_interal_server",
          code: NetworkConstants.response_internal_server_error,
        );
      }
      return ApiResponse(message: bodyJson['message'] ?? 'error_unknown');
    } catch (e) {
      LogUtils.error('NetworkRepository', '_getApiResponse<T>', e.toString());
      return ApiResponse(message: 'error_unknown');
    }
  }

  NetworkResponseType _getNetworkResponseType(http.Response? response) {
    final status = response?.statusCode;
    if (NetworkConstants.response_success_list.contains(status)) {
      return NetworkResponseType.success_200;
    } else if (status == NetworkConstants.response_bad_request) {
      return NetworkResponseType.badRequest_400;
    } else if (status == NetworkConstants.response_unauthorized) {
      return NetworkResponseType.unauthorized_401;
    } else if (status == NetworkConstants.response_conflict) {
      return NetworkResponseType.conflict_409;
    } else if (status == NetworkConstants.response_internal_server_error) {
      return NetworkResponseType.serverInternalError_500;
    } else {
      return NetworkResponseType.unknown;
    }
  }

  String _getNetworkResponseBody(String? body) {
    return '${NetworkConstants.success_base_response_start}'
        '${body ?? ''}'
        '${NetworkConstants.success_base_response_end}';
  }

  @override
  Future<ApiResponse<Address>> fisrtAddress({required int userId}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPIv1.instance.userGetFirstAddress(userId: userId),
      token: token,
    );
    return _getApiResponse(response, (data) {
      return data != null ? Address.fromJson(data['addresses']) : null;
    });
  }

  @override
  Future<ApiResponse<String>> changeStoreImage(
      {required int storeId, required String images}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPIv1.instance.storeChangeImage(storeId: storeId),
      token: token,
      body: {'image': images},
    );
    return _getApiResponse(response, (data) {
      return data != null ? Category.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<String>> changeStoreName(
      {required int storeId, required String name}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPIv1.instance.storeChangeName(storeId: storeId),
      token: token,
      body: {'name': name},
    );
    return _getApiResponse(response, (data) {
      return data != null ? Category.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<String>> changeStoreTime(
      {required int storeId,
      required DateTime openTime,
      required DateTime closeTime}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.post,
      uri: CenaServiceAPIv1.instance.storeChangeTime(storeId: storeId),
      token: token,
      body: {'openTime': openTime, 'closeTime': closeTime},
    );
    return _getApiResponse(response, (data) {
      return data != null ? Category.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<List<Store>>> fetchAllStore(
      {required int offset,
      required int limit,
      required String lat,
      required String lng}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPIv1.instance.storeGetNearByLngLat(
          sort: 'asc', offset: offset, limit: limit, lng: lng, lat: lat),
      token: token,
    );
    return _getApiResponse(response, (data) {
      return data != null ? StoresResponse.fromJson(data).stores : null;
    });
  }

  @override
  Future<ApiResponse<Store>> getStoreById({required int storeId}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPIv1.instance.storeGetById(storeId: storeId),
      token: token,
    );
    return _getApiResponse(response, (data) {
      return data != null ? Store.fromJson(data["stores"]) : null;
    });
  }

  @override
  Future<ApiResponse<String>> getStoreName({required int storeId}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPIv1.instance.storeGetNameById(storeId: storeId),
      token: token,
    );
    return _getApiResponse(response, (data) {
      return data != null ? Category.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<String>> getStoreVoucher({required int storeId}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPIv1.instance.storeGetVoucher(storeId: storeId),
      token: token,
    );
    return _getApiResponse(response, (data) {
      return data != null ? Category.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<String>> registerDeliveryOfStore(
      {required int storeId,
      required String name,
      required String lastName,
      required String phone,
      required String email,
      required String password,
      required Map<String, String> image,
      required String nToken}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.requestMultipart(
      NetworkRequestType.post,
      uri: CenaServiceAPIv1.instance.storeRegisterDelivery(storeId: storeId),
      token: token,
      fields: {
        'firstName': name,
        'lastName': lastName,
        'phone': phone,
        'email': email,
        'password': password,
        'notification_token': nToken,
      },
      filesPath: image,
    );
    return _getApiResponse(response, (data) {
      return data != null ? Category.fromJson(data) : null;
    });
  }

  @override
  Future<ApiResponse<List<String>>> fetchAllNameCategory(
      {required int storeId}) async {
    final token = await _storageService.getAccessToken();

    final response = await NetworkClient.instance.request(
      NetworkRequestType.get,
      uri: CenaServiceAPIv1.instance.storeGetAllCategories(
        storeId: storeId,
      ),
      token: token,
      body: {},
    );
    return _getApiResponse(response, (data) {
      if (data != null) {
        List<String> result = [];
        data["categories"].forEach((e) => result.add(e['category']));
        return result;
      } else {
        return null;
      }
    });
  }
}
