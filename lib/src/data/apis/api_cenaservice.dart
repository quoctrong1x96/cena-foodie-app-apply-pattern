import 'package:cenafoodie/src/utils/constants/cena_service_constants.dart';

class CenaServiceAPIv1 {
  const CenaServiceAPIv1._internal();

  // ignore: prefer_const_constructors
  static final CenaServiceAPIv1 _instance = CenaServiceAPIv1._internal();

  static CenaServiceAPIv1 get instance => _instance;

  static const String _apiBaseUrl = CenaServiceConstants.BASE_URL;
  static const int _port = CenaServiceConstants.URL_PORT;
  static const String _apiPathVersionV1 = CenaServiceConstants.URL_API_PATHv1;
  static const String _scheme = CenaServiceConstants.URL_SCHEME;

  /// ==================[AUTHENTICATION]========================================
  /// Feature Authentication of Cena Foodie
  /// Login with email function
  Uri authOnEmail() => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_auth,
        endpoint: "login-email",
        parameterBuilder: () => {},
      );

  /// Login with phone number function
  Uri authOnPhone() => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_auth,
        endpoint: "login-phone",
        parameterBuilder: () => {},
      );

  /// renew token
  Uri authOnRenewToken() => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_auth,
        endpoint: "renew-token-login",
        parameterBuilder: () => {},
      );

  /// ==================[CATEGORIes]========================================
  Uri storeAddCategory({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/categories",
        parameterBuilder: () => {},
      );

  Uri storeDeleteCategory({
    required int storeId,
    required int categoryId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/categories/$categoryId",
        parameterBuilder: () => {},
      );

  Uri storeUpdateCategory({
    required int storeId,
    required int categoryId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/categories/$categoryId",
        parameterBuilder: () => {},
      );

  Uri storeGetAllCategories({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/categories",
        parameterBuilder: () => {},
      );

  Uri storeGetCategories({
    required int storeId,
    required String sort,
    required int offset,
    required int limit,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/categories",
        parameterBuilder: () => filterCategories(
          sort: sort,
          offset: offset,
          limit: limit,
        ),
      );

  Uri storeGetCategoryById({
    required int storeId,
    required int categoryId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/categories/$categoryId",
        parameterBuilder: () => {},
      );

  /// ==================[USERs]========================================
  Uri userById({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId",
        parameterBuilder: () => {},
      );

  Uri userChangeProfiles({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId",
        parameterBuilder: () => {},
      );

  Uri userChangePassword({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/password",
        parameterBuilder: () => {},
      );

  Uri userChangeProfilesImages({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/image-profile",
        parameterBuilder: () => {},
      );

  Uri userChangeProfilesLastName({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/last-name",
        parameterBuilder: () => {},
      );
  Uri userChangeProfilesFirstName({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/first-name",
        parameterBuilder: () => {},
      );

  Uri userChangeProfilesSex({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/sex",
        parameterBuilder: () => {},
      );

  Uri userChangeProfilesDateOfBirth({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/date-of-birth",
        parameterBuilder: () => {},
      );

  Uri userChangeProfilesWork({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/sex",
        parameterBuilder: () => {},
      );

  Uri userOnAdd() => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "",
        parameterBuilder: () => {},
      );

  Uri userGetAllAddresses({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/addresses",
        parameterBuilder: () => {},
      );

  Uri userAddAddresses({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/addresses",
        parameterBuilder: () => {},
      );

  Uri userDeleteAddress({
    required int userId,
    required int addressId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/addresses/$addressId",
        parameterBuilder: () => {},
      );

  Uri userGetAddress({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/addresses",
        parameterBuilder: () => {},
      );

  Uri userGetFirstAddress({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/addresses",
        parameterBuilder: () => {},
      );

  Uri userGetAddressById({
    required int userId,
    required int addressId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/addresses/$addressId",
        parameterBuilder: () => {},
      );

  Uri userUpdateNotificationToken({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/notification-token",
        parameterBuilder: () => {},
      );

  Uri userGetAdminsNotificationToken() => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "admins-notification-token",
        parameterBuilder: () => {},
      );

  Uri userFromDelivery({
    required int deliveryId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "update-delivery-to-client/$deliveryId",
        parameterBuilder: () => {},
      );

  Uri userEnterReferenceCode({required int userId}) => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/reference",
        parameterBuilder: () => {},
      );

  ///==========================[ORDERs]=========================================

  Uri orderAdd() => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "",
        parameterBuilder: () => {},
      );
  Uri orderById({
    required int orderId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$orderId",
        parameterBuilder: () => {},
      );
  Uri orderToDispatch({
    required int orderId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$orderId/to-dispatch",
        parameterBuilder: () => {},
      );

  Uri orderToOnWay({
    required int orderId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$orderId/to-on-way",
        parameterBuilder: () => {},
      );

  Uri orderToDelivered({
    required int orderId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$orderId/to-delivered",
        parameterBuilder: () => {},
      );
  Uri orderToCancelled({
    required int orderId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$orderId/to-cancelled",
        parameterBuilder: () => {},
      );

  Uri orderGet({
    required String status,
    required String typeObject,
    required int objectId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "",
        parameterBuilder: () => filterOrder(
          status: status,
          typeObject: typeObject,
          objectId: objectId,
        ),
      );

  ///==========================[ORDERs]=========================================

  Uri productAdd({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "/$storeId/products",
        parameterBuilder: () => {},
      );
  Uri productUpdateStatus({
    required int storeId,
    required int productId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "/$storeId/products/$productId",
        parameterBuilder: () => {},
      );

  Uri productUpdate({
    required int orderId,
    required int productId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$orderId/products/$productId",
        parameterBuilder: () => {},
      );

  Uri productGetAllForStore({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$storeId/products",
        parameterBuilder: () => {},
      );

  Uri productGetImages({
    required int storeId,
    required int productId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$storeId/products/$productId",
        parameterBuilder: () => {},
      );

  Uri productSearchByName({required String productName}) => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_product,
        endpoint: "search-product-for-name/$productName",
        parameterBuilder: () => {},
      );

  Uri productSearchByCategory({required String categoryName}) => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_product,
        endpoint: "search-product-for-category/$categoryName",
        parameterBuilder: () => {},
      );
  Uri productDelete({
    required int storeId,
    required int productId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/products/$productId",
        parameterBuilder: () => {},
      );

  ///==========================[STOREs]=========================================

  Uri storeGetById({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId",
        parameterBuilder: () => {},
      );

  Uri storeGetNameById({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/name",
        parameterBuilder: () => {},
      );

  Uri storeGetNearByLngLat({
    required String sort,
    required int offset,
    required int limit,
    required String lng,
    required String lat,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "",
        parameterBuilder: () => _filterStoreByLongLat(
          sort: sort,
          offset: offset,
          limit: limit,
          lng: lng,
          lat: lat,
        ),
      );

  Uri storeChangeImage({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/image",
        parameterBuilder: () => {},
      );

  Uri storeChangeName({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/image",
        parameterBuilder: () => {},
      );

  Uri storeChangeTime({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/time",
        parameterBuilder: () => {},
      );

  Uri storeGetVoucher({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/voucher",
        parameterBuilder: () => {},
      );

  Uri storeRegisterDelivery({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/deliveries",
        parameterBuilder: () => {},
      );
  Uri storeFetchAllDelivery({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/deliveries",
        parameterBuilder: () => {},
      );

  ///==========================[UTIL]===========================================
  Uri _buildUri({
    required groupEndpoint,
    required endpoint,
    required Map<String, dynamic>? Function() parameterBuilder,
  }) {
    return Uri(
        scheme: _scheme,
        host: _apiBaseUrl,
        path: "$_apiPathVersionV1/$groupEndpoint/$endpoint",
        port: _port,
        queryParameters: parameterBuilder());
  }

  Map<String, dynamic>? filterCategories({
    required String sort,
    required int offset,
    required int limit,
  }) =>
      {
        "sort": sort,
        "offset": offset,
        "limit": limit,
      };

  Map<String, dynamic>? _filterStoreByLongLat({
    required String sort,
    required int offset,
    required int limit,
    required String lng,
    required String lat,
  }) =>
      {
        "sort": sort,
        "offset": offset,
        "limit": limit,
        "lat": lat,
        "lng": lng,
      };

  Map<String, dynamic>? filterOrder({
    required String status,
    required String typeObject,
    required int objectId,
  }) =>
      {
        "status": status,
        "type": typeObject,
        "object_id": objectId,
      };
}
