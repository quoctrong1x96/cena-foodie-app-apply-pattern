import '../../models/entities/cart/cart.dart';
import '../../models/entities/order/order.dart';
import '../../models/entities/order/order_request_add.dart';
import '../../models/ui/ui_response.dart';
import '../../services/entities/order_service.dart';
import '../base_repository.dart';

class OrderRepository extends BaseRepository implements IOrderService {
  @override
  Future<UiResponse<Order>> add(
      {required int addressId,
      required double total,
      required String typePayment,
      required List<Cart> carts}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.addOrder(
        orderRequestAdd: OrderRequestAdd(
            addressId: addressId,
            total: total,
            typePayment: typePayment,
            carts: carts));
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<List<Order>>> fetChAllByStatusForStore(
      {required int storeId, required String status}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.fetChAllOrderByStatusForStore(
        storeId: storeId, status: status);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<List<Order>>> fetchAllByStatusForClient(
      {required int clientId, required String status}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.fetchAllByStatusForClient(
        clientId: clientId, status: status);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<List<Order>>> fetchAllByStatusForDelivery(
      {required int deliveryId, required String status}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.fetchAllByStatusForDelivery(
        deliveryId: deliveryId, status: status);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<Order>> getDetail({required int orderId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.getOrderDetail(orderId: orderId);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> toCancelled({required String orderId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.setOrderToCancelled(orderId: orderId);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> toDelivered({required String orderId}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.setOrderToDelivered(orderId: orderId);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> toDispatch(
      {required String orderId,
      required String deliveryId,
      required int storeId,
      required String storeLat,
      required String storeLng}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.setOrderToDispatch(
        orderId: orderId,
        deliveryId: deliveryId,
        storeId: storeId,
        storeLat: storeLat,
        storeLng: storeLng);
    return UiResponse.map(response);
  }

  @override
  Future<UiResponse<String>> toOnWay(
      {required String orderId,
      required String desLat,
      required String desLng}) async {
    if (!await hasInternet()) {
      return UiResponse(
        errorMessage: "error_internet_unavailable",
      );
    }
    final response = await cenaService.setOrderToOnWay(
        orderId: orderId, desLat: desLat, desLng: desLng);
    return UiResponse.map(response);
  }
}
