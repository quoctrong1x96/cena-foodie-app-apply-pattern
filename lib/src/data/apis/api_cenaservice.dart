class CenaServiceAPI {
  static const String _apiBaseUrl = "108.135.103.56";
  static const int _port = 7070;
  static const String _apiPathVersion1 = "/api/v1";
  static const String _scheme = "http";

  /// ==================[AUTHENTICATION]========================================
  /// Feature Authentication of Cena Foodie
  /// Login with email function
  Uri authOnEmail() => _buildUri(
        groupEndpoint: "auth",
        endpoint: "login-email",
        parameterBuilder: () => {},
      );

  /// Login with phone number function
  Uri authOnPhone() => _buildUri(
        groupEndpoint: "auth",
        endpoint: "login-phone",
        parameterBuilder: () => {},
      );

  /// renew token
  Uri authOnRenewToken() => _buildUri(
        groupEndpoint: "auth",
        endpoint: "renew-token-login",
        parameterBuilder: () => {},
      );

  /// ==================[CATEGORIes]========================================
  Uri storeAddCategory({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: "stores",
        endpoint: "$storeId/categories",
        parameterBuilder: () => {},
      );

  Uri storeDeleteCategory({
    required int storeId,
    required int categoryId,
  }) =>
      _buildUri(
        groupEndpoint: "stores",
        endpoint: "$storeId/categories/$categoryId",
        parameterBuilder: () => {},
      );

  Uri storeUpdateCategory({
    required int storeId,
    required int categoryId,
  }) =>
      _buildUri(
        groupEndpoint: "stores",
        endpoint: "$storeId/categories/$categoryId",
        parameterBuilder: () => {},
      );

  Uri storeGetAllCategories({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: "stores",
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
        groupEndpoint: "stores",
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
        groupEndpoint: "stores",
        endpoint: "$storeId/categories/$categoryId",
        parameterBuilder: () => {},
      );

  /// ==================[USERs]========================================
  Uri userById({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId",
        parameterBuilder: () => {},
      );

  Uri userChangeProfiles({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId",
        parameterBuilder: () => {},
      );

  Uri userChangePassword({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId/password",
        parameterBuilder: () => {},
      );

  Uri userChangeProfilesImages({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId/image-profile",
        parameterBuilder: () => {},
      );

  Uri userChangeProfilesLastName({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId/last-name",
        parameterBuilder: () => {},
      );
  Uri userChangeProfilesFirstName({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId/first-name",
        parameterBuilder: () => {},
      );

  Uri userChangeProfilesSex({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId/sex",
        parameterBuilder: () => {},
      );

  Uri userChangeProfilesDateOfBirth({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId/date-of-birth",
        parameterBuilder: () => {},
      );

  Uri userChangeProfilesWork({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId/sex",
        parameterBuilder: () => {},
      );

  Uri userOnAdd() => _buildUri(
        groupEndpoint: "users",
        endpoint: "",
        parameterBuilder: () => {},
      );

  Uri userGetAllAddAddresses({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId/addresses",
        parameterBuilder: () => {},
      );
  Uri userDeleteAddress({
    required int userId,
    required int addressId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId/addresses/$addressId",
        parameterBuilder: () => {},
      );

  Uri userGetAddress({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId/addresses",
        parameterBuilder: () => {},
      );

  Uri userGetFirstAddress({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId/addresses",
        parameterBuilder: () => {},
      );

  Uri userGetAddressById({
    required int userId,
    required int addressId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId/addresses/$addressId",
        parameterBuilder: () => {},
      );

  Uri userUpdateNotificationToken({
    required int userId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId/notification-token",
        parameterBuilder: () => {},
      );

  Uri userGetAdminsNotificationToken() => _buildUri(
        groupEndpoint: "users",
        endpoint: "admins-notification-token",
        parameterBuilder: () => {},
      );

  Uri userFromDelivery({
    required int deliveryId,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "update-delivery-to-client/$deliveryId",
        parameterBuilder: () => {},
      );

  Uri userEnterReferenceCode({
    required int userId,
    required String referCode,
  }) =>
      _buildUri(
        groupEndpoint: "users",
        endpoint: "$userId/reference",
        parameterBuilder: () => {},
      );

  ///==========================[STOREs]=========================================

  Uri storeGetById({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: "stores",
        endpoint: "$storeId",
        parameterBuilder: () => {},
      );

  Uri storeGetNameById({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: "stores",
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
        groupEndpoint: "stores",
        endpoint: "",
        parameterBuilder: () => filterStoreByLongLat(
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
        groupEndpoint: "stores",
        endpoint: "$storeId/image",
        parameterBuilder: () => {},
      );

  Uri storeChangeTime({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: "stores",
        endpoint: "$storeId/time",
        parameterBuilder: () => {},
      );

  Uri storeGetVoucher({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: "stores",
        endpoint: "$storeId/voucher",
        parameterBuilder: () => {},
      );

  Uri storeRegisterDelivery({
    required int storeId,
  }) =>
      _buildUri(
        groupEndpoint: "stores",
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
        path: "$_apiPathVersion1/$groupEndpoint/$endpoint",
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

  Map<String, dynamic>? filterStoreByLongLat({
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
}
