import 'package:cenafoodie/src/utils/constants/cena_service_constants.dart';

class CenaServiceAPIv1 {
  const CenaServiceAPIv1._internal();

  // ignore: prefer_const_constructors
  static final CenaServiceAPIv1 _instance = CenaServiceAPIv1._internal();

  static CenaServiceAPIv1 get instance => _instance;

  static const String _apiBaseUrl = CenaServiceConstants.BASE_URL;
  static const int? _port = CenaServiceConstants.URL_PORT;
  static const String _apiPathVersionV1 = CenaServiceConstants.URL_API_PATHv1;
  static const String _scheme = CenaServiceConstants.URL_SCHEME;

  /// ==================[AUTHENTICATION]========================================
  /// Feature Authentication of Cena Foodie
  /// Login with email function
  Uri authOnEmail() => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_auth,
        endpoint: "login-email",
        parameterBuilder: () => null,
      );

  /// Login with phone number function
  Uri authOnPhone() => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_auth,
        endpoint: "login-phone",
        parameterBuilder: () => null,
      );

  /// renew token
  Uri authOnRenewToken() => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_auth,
        endpoint: "renew-token-login",
        parameterBuilder: () => null,
      );

  /// ==================[CATEGORIes]========================================
  Uri storeAddCategory({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/categories",
        parameterBuilder: () => null,
      );

  Uri storeDeleteCategory({
    required int storeId,
    required int categoryId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/categories/$categoryId",
        parameterBuilder: () => null,
      );

  Uri storeUpdateCategory({
    required int storeId,
    required int categoryId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/categories/$categoryId",
        parameterBuilder: () => null,
      );

  Uri storeGetAllCategories({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/categories",
        parameterBuilder: () => null,
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
        parameterBuilder: () => null,
      );

  /// ==================[USERs]========================================
  Uri userById({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId",
        parameterBuilder: () => null,
      );

  Uri userChangeProfiles({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId",
        parameterBuilder: () => null,
      );

  Uri userChangePassword({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/password",
        parameterBuilder: () => null,
      );

  Uri userChangeProfilesImages({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/image-profile",
        parameterBuilder: () => null,
      );

  Uri userChangeProfilesLastName({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/last-name",
        parameterBuilder: () => null,
      );
  Uri userChangeProfilesFirstName({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/first-name",
        parameterBuilder: () => null,
      );

  Uri userChangeProfilesSex({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/sex",
        parameterBuilder: () => null,
      );

  Uri userChangeProfilesDateOfBirth({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/date-of-birth",
        parameterBuilder: () => null,
      );

  Uri userChangeProfilesWork({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/sex",
        parameterBuilder: () => null,
      );

  Uri userOnAdd() => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        parameterBuilder: () => null,
      );

  Uri userGetAllAddresses({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/addresses",
        parameterBuilder: () => null,
      );

  Uri userAddAddresses({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/addresses",
        parameterBuilder: () => null,
      );

  Uri userDeleteAddress({
    required int userId,
    required int addressId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/addresses/$addressId",
        parameterBuilder: () => null,
      );

  Uri userGetAddress({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/addresses",
        parameterBuilder: () => null,
      );

  Uri userGetFirstAddress({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/addresses",
        parameterBuilder: () => null,
      );

  Uri userGetAddressById({
    required int userId,
    required int addressId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/addresses/$addressId",
        parameterBuilder: () => null,
      );

  Uri userUpdateNotificationToken({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/notification-token",
        parameterBuilder: () => null,
      );

  Uri userGetAdminsNotificationToken() => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "admins-notification-token",
        parameterBuilder: () => null,
      );

  Uri userFromDelivery({
    required int deliveryId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "update-delivery-to-client/$deliveryId",
        parameterBuilder: () => null,
      );

  Uri userEnterReferenceCode({required int userId}) => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_user,
        endpoint: "$userId/reference",
        parameterBuilder: () => null,
      );

  ///==========================[ORDERs]=========================================

  Uri orderAdd() => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        parameterBuilder: () => null,
      );
  Uri orderById({
    required int orderId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$orderId",
        parameterBuilder: () => null,
      );
  Uri orderToDispatch({
    required int orderId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$orderId/to-dispatch",
        parameterBuilder: () => null,
      );

  Uri orderToOnWay({
    required int orderId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$orderId/to-on-way",
        parameterBuilder: () => null,
      );

  Uri orderToDelivered({
    required int orderId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$orderId/to-delivered",
        parameterBuilder: () => null,
      );
  Uri orderToCancelled({
    required int orderId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$orderId/to-cancelled",
        parameterBuilder: () => null,
      );

  Uri orderGet({
    required String status,
    required String typeObject,
    required int objectId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
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
        parameterBuilder: () => null,
      );
  Uri productUpdateStatus({
    required int storeId,
    required int productId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "/$storeId/products/$productId",
        parameterBuilder: () => null,
      );

  Uri productUpdate({
    required int orderId,
    required int productId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$orderId/products/$productId",
        parameterBuilder: () => null,
      );

  Uri productGetAllForStore({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$storeId/products",
        parameterBuilder: () => null,
      );

  Uri productGetImages({
    required int storeId,
    required int productId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_order,
        endpoint: "$storeId/products/$productId",
        parameterBuilder: () => null,
      );

  Uri productSearchByName({required String productName}) => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_product,
        endpoint: "search-product-for-name/$productName",
        parameterBuilder: () => null,
      );

  Uri productSearchByCategory({required String categoryName}) => _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_product,
        endpoint: "search-product-for-category/$categoryName",
        parameterBuilder: () => null,
      );
  Uri productDelete({
    required int storeId,
    required int productId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/products/$productId",
        parameterBuilder: () => null,
      );

  ///==========================[STOREs]=========================================

  Uri storeGetById({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId",
        parameterBuilder: () => null,
      );

  Uri storeGetNameById({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/name",
        parameterBuilder: () => null,
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
        parameterBuilder: () => null,
      );

  Uri storeChangeName({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/image",
        parameterBuilder: () => null,
      );

  Uri storeChangeTime({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/time",
        parameterBuilder: () => null,
      );

  Uri storeGetVoucher({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/voucher",
        parameterBuilder: () => null,
      );

  Uri storeRegisterDelivery({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/deliveries",
        parameterBuilder: () => null,
      );
  Uri storeFetchAllDelivery({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: CenaServiceConstants.api_group_store,
        endpoint: "$storeId/deliveries",
        parameterBuilder: () => null,
      );

  ///==========================[UTIL]===========================================
  Uri _buildUri({
    required String groupEndpoint,
    String? endpoint,
    required Map<String, dynamic>? Function() parameterBuilder,
  }) {
    return Uri(
        scheme: _scheme,
        host: _apiBaseUrl,
        path: "$_apiPathVersionV1/$groupEndpoint" +
            (endpoint != null ? "/$endpoint" : ""),
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
        "offset": offset.toString(),
        "limit": limit.toString(),
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
