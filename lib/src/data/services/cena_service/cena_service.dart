// A network service contract [Usage: API Calls]
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/entities/address/address.dart';
import '../../models/entities/cart/cart.dart';
import '../../models/entities/category/category.dart';
import '../../models/entities/delivery/delivery.dart';
import '../../models/entities/order/order.dart';
import '../../models/entities/product/product.dart';
import '../../models/entities/product/product_image.dart';
import '../../models/entities/user/user_request.dart';
import '../../models/networks/api_response/api_response.dart';

abstract class ICenaService {
  /// #region [Authentication_API]

  /// Check token
  Future<ApiResponse<User>> renewToken(UserRequest? userRequest);

  ///Login with email and password
  Future<ApiResponse<User>> loginWithEmail(UserRequest? userRequest);

  ///Login with phone number
  Future<ApiResponse<User>> loginWithPhone(UserRequest? userRequest);

  // #endregion

  /// #region [User_API]

  ///Get user by id
  Future<ApiResponse<User>> getUserById({required int userID});

  ///Change all profiles
  Future<ApiResponse<String>> changeUserProfile({required User user});

  ///Change Password
  Future<ApiResponse<String>> changeUserPassword(
      {required int userId, required String oldPassword, required newPassword});

  ///Change profile image
  Future<ApiResponse<String>> changeUserImage(
      {required int userId, required String imageUrl});

  /// Change last name
  Future<ApiResponse<String>> changeUserLastName(
      {required int userId, required String lastName});

  /// Change first name
  Future<ApiResponse<String>> changeUserFirstName(
      {required int userId, required String lastName});

  /// Change sex
  Future<ApiResponse<String>> changeUserSex(
      {required int userId, required String sexType});

  /// Change first name
  Future<ApiResponse<String>> changeUserDateOfBirth(
      {required int userId, required DateTime dateOfBirth});

  /// Change work
  Future<ApiResponse<String>> changeUserWork(
      {required int userId, required String work});

  /// Register new user
  Future<ApiResponse<User>> registerUser(
      {required User user, required String password});

  //Update notification token
  Future<ApiResponse<String>> updateUserNotifyToken(
      {required User user, required String password});

  ///Enter reference code
  Future<ApiResponse<String>> enterReferenceCodeOfUser(
      {required User user, required String code});

  // #endregion

  /// #region [Store_API]

  ///Get user by id
  Future<ApiResponse<String>> getStoreAdminToken({required int storeId});

  // #endregion

  ///#region [Delivery_API]

  ///Get user by id
  Future<ApiResponse<Delivery>> convertToClient({required int deliveryId});

  /// Get all delivery of store
  Future<ApiResponse<List<Delivery>>> fetchAllOfStore({required int storeId});

  // #endregion

  /// #region [Address_API]

  ///Get All address by User
  Future<ApiResponse<List<Address>>> fetchAllAddress({required int userId});

  /// Get address by id
  Future<ApiResponse<Address>> getAddressById(
      {required int userId, required int addressId});

  ///Delete address
  Future<ApiResponse<String>> deleteAddress(
      {required int userId, required int addressId});

  /// Add address for user
  Future<ApiResponse<Address>> addAddress({required Address address});

  // #endregion

  /// #region [Category_API]

  ///Get user by id
  Future<ApiResponse<List<Category>>> fetchAllCategory({required int storeId});

  /// Add category to store
  Future<ApiResponse<Category>> addCategory(
      {required int storeId, required Category category});

  ///Update category
  Future<ApiResponse<String>> updateCategory(
      {required int storeId, required Category category});

  /// Delete category
  Future<ApiResponse<String>> deleteCategory(
      {required int storeId, required int categoryId});

  // #endregion

  /// #region [Order_API]

  ///Get order for delivery by status
  Future<ApiResponse<List<Order>>> fetchAllByStatusForDelivery(
      {required int deliveryId, required String status});

  ///Get order for delivery by status
  Future<ApiResponse<List<Order>>> fetchAllByStatusForClient(
      {required int clientId, required String status});

  /// Get all delivery of store
  Future<ApiResponse<List<Order>>> addOrder(
      {required int addressId,
      required double total,
      required String typePayment,
      required List<Cart> carts});

  //Get all order for store by status
  Future<ApiResponse<List<Order>>> fetChAllOrderByStatusForStore(
      {required int storeId, required String status});

  ///Get detail order
  Future<ApiResponse<Order>> getOrderDetail({required int orderId});

  ///Update status of order to Dispatch
  Future<ApiResponse<String>> setOrderToDispatch(
      {required String orderId,
      required String deliveryId,
      required int storeId,
      required String storeLat,
      required String storeLng});

  ///Update status of order to On way
  Future<ApiResponse<String>> setOrderToOnWay(
      {required String orderId,
      required String desLat,
      required String desLng});

  ///Update status of order to Delivered
  Future<ApiResponse<String>> setOrderToDelivered({required String orderId});

  ///Update status of order to Cancelled
  Future<ApiResponse<String>> setOrderToCancelled({required String orderId});
  // #endregion

  /// #region [Product_API]

  ///Add product
  Future<ApiResponse<String>> addProduct(
      {required int storeId,
      required String name,
      required String description,
      required String price,
      required List<XFile> images,
      required String category});

  ///Update product
  Future<ApiResponse<String>> updateProduct(
      {required int storeId,
      required int productId,
      required String name,
      required String description,
      required String price,
      required List<XFile> images,
      required String category});

  ///Delete product
  Future<ApiResponse<String>> deleteProduct(
      {required int storeId, required int productId});

  ///Get all product of store
  Future<ApiResponse<List<Product>>> fetchAllProduct({required int storeId});

  ///Get list images of product
  Future<ApiResponse<List<ProductImage>>> getProductImages(
      {required int storeId, required int productId});

  ///Search product by name
  Future<ApiResponse<void>> searchProductByName({required String productName});

  ///Search product by category
  Future<ApiResponse<void>> searchProductByCategory(
      {required String categoryName});

  //Update status of product
  Future<ApiResponse<String>> updateProductStatus(
      {required int storeId, required int productId, required String status});

  /// #endregion

}
