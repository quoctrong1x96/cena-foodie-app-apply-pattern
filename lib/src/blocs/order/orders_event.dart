part of 'orders_bloc.dart';

@immutable
abstract class OrdersEvent {}

class OnAddNewOrdersEvent extends OrdersEvent {
  final int uidAddress;
  final double total;
  final String typePayment;
  final List<ProductCart> products;
  final int storeId;

  OnAddNewOrdersEvent(this.uidAddress, this.total, this.typePayment,
      this.products, this.storeId);
}

class OnUpdateStatusOrderToDispatchedEvent extends OrdersEvent {
  final String idOrder;
  final String idDelivery;
  final String notificationTokenDelivery;
  final int storeId;
  final String storeLatitude;
  final String storeLongitude;

  OnUpdateStatusOrderToDispatchedEvent(
      this.idOrder,
      this.idDelivery,
      this.notificationTokenDelivery,
      this.storeId,
      this.storeLatitude,
      this.storeLongitude);
}

class OnUpdateStatusOrderOnWayEvent extends OrdersEvent {
  final String idOrder;
  final LatLng locationDelivery;

  OnUpdateStatusOrderOnWayEvent(this.idOrder, this.locationDelivery);
}

class OnUpdateStatusOrderDeliveredEvent extends OrdersEvent {
  final String idOrder;

  OnUpdateStatusOrderDeliveredEvent(this.idOrder);
}

class OnUpdateStatusOrderCancelledEvent extends OrdersEvent {
  final String idOrder;

  OnUpdateStatusOrderCancelledEvent(this.idOrder);
}
