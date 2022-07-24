import '../../models/entities/cart/cart.dart';
import '../../models/entities/order/order.dart';
import '../../models/ui/ui_response.dart';

abstract class IOrderService {
  ///Get order for delivery by status
  Future<UiResponse<List<Order>>> fetchAllByStatusForDelivery({
    required int deliveryId,
    required String status,
  });

  ///Get order for delivery by status
  Future<UiResponse<List<Order>>> fetchAllByStatusForClient({
    required int clientId,
    required String status,
  });

  /// Get all delivery of store
  Future<UiResponse<List<Order>>> add({
    required int addressId,
    required double total,
    required String typePayment,
    required List<Cart> carts,
  });

  //Get all order for store by status
  Future<UiResponse<List<Order>>> fetChAllByStatusForStore({
    required int storeId,
    required String status,
  });

  ///Get detail order
  Future<UiResponse<Order>> getDetail({required int orderId});

  ///Update status of order to Dispatch
  Future<UiResponse<String>> toDispatch({
    required String orderId,
    required String deliveryId,
    required int storeId,
    required String storeLat,
    required String storeLng,
  });

  ///Update status of order to On way
  Future<UiResponse<String>> toOnWay({
    required String orderId,
    required String desLat,
    required String desLng,
  });

  ///Update status of order to Delivered
  Future<UiResponse<String>> toDelivered({required String orderId});

  ///Update status of order to Cancelled
  Future<UiResponse<String>> toCancelled({required String orderId});
}
