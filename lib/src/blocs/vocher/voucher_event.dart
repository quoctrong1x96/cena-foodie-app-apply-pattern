part of 'voucher_bloc.dart';

@immutable
abstract class VoucherEvent {}

class OnAddNewVoucherEvent extends VoucherEvent {
  final int uidAddress;
  final double total;
  final String typePayment;
  final List<ProductCart> products;
  final int storeId;

  OnAddNewVoucherEvent(this.uidAddress, this.total, this.typePayment,
      this.products, this.storeId);
}

class OnUpdateStatusOrderToDispatchedEvent extends VoucherEvent {
  final String idOrder;
  final String idDelivery;
  final String notificationTokenDelivery;

  OnUpdateStatusOrderToDispatchedEvent(
      this.idOrder, this.idDelivery, this.notificationTokenDelivery);
}

class OnUpdateStatusOrderOnWayEvent extends VoucherEvent {
  final String idOrder;
  final LatLng locationDelivery;

  OnUpdateStatusOrderOnWayEvent(this.idOrder, this.locationDelivery);
}

class OnUpdateStatusOrderDeliveredEvent extends VoucherEvent {
  final String idOrder;

  OnUpdateStatusOrderDeliveredEvent(this.idOrder);
}
