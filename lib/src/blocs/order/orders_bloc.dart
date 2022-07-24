import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../controllers/orders_controller.dart';
import '../../controllers/user_controller.dart';
import '../../../main.dart';
import '../../models/product_cart.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  OrdersBloc() : super(OrdersState()) {
    on<OnAddNewOrdersEvent>(_onAddNewOrders);
    on<OnUpdateStatusOrderToDispatchedEvent>(_onUpdateStatusOrderToDispatched);
    on<OnUpdateStatusOrderOnWayEvent>(_onUpdateStatusOrderOnWay);
    on<OnUpdateStatusOrderDeliveredEvent>(_onUpdateStatusOrderDelivered);
    on<OnUpdateStatusOrderCancelledEvent>(_onUpdateStatusOrderCancelled);
  }

  Future<void> _onAddNewOrders(
      OnAddNewOrdersEvent event, Emitter<OrdersState> emit) async {
    try {
      emit(LoadingOrderState());

      await Future.delayed(const Duration(milliseconds: 1500));

      final resp = await ordersController.addNewOrders(
          event.uidAddress, event.total, event.typePayment, event.products);

      if (resp.resp) {
        final listTokens =
            await userController.getAdminsNotificationToken(event.storeId);

        Map<String, dynamic> data = {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK'
        };
        NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
        await pushNotification.sendNotification(
            listTokens[0]["notification_token"]!,
            data,
            'Order #${resp.orderId}',
            'Tổng đơn: ${numberFormat.format((event.total).toInt()).toString()} vnđ, Hình thức thanh toán: ${event.typePayment}');

        emit(SuccessOrdersState());
      } else {
        emit(FailureOrdersState(resp.msg));
      }
    } catch (e) {
      emit(FailureOrdersState(e.toString()));
    }
  }

  Future<void> _onUpdateStatusOrderToDispatched(
      OnUpdateStatusOrderToDispatchedEvent event,
      Emitter<OrdersState> emit) async {
    try {
      emit(LoadingOrderState());

      final resp = await ordersController.updateStatusOrderToDispatched(
          event.idOrder,
          event.idDelivery,
          event.storeId,
          event.storeLatitude,
          event.storeLongitude);

      await Future.delayed(const Duration(seconds: 1));

      if (resp.resp) {
        Map<String, dynamic> data = {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK'
        };

        await pushNotification.sendNotification(event.notificationTokenDelivery,
            data, 'Assigned order', 'New order assigned');

        emit(SuccessOrdersState());
      } else {
        emit(FailureOrdersState(resp.msg));
      }
    } catch (e) {
      emit(FailureOrdersState(e.toString()));
    }
  }

  Future<void> _onUpdateStatusOrderOnWay(
      OnUpdateStatusOrderOnWayEvent event, Emitter<OrdersState> emit) async {
    try {
      emit(LoadingOrderState());

      final resp = await ordersController.updateOrderStatusOnWay(
          event.idOrder,
          event.locationDelivery.latitude.toString(),
          event.locationDelivery.longitude.toString());

      await Future.delayed(const Duration(seconds: 1));

      if (resp.resp) {
        emit(SuccessOrdersState());
      } else {
        emit(FailureOrdersState(resp.msg));
      }
    } catch (e) {
      emit(FailureOrdersState(e.toString()));
    }
  }

  Future<void> _onUpdateStatusOrderDelivered(
      OnUpdateStatusOrderDeliveredEvent event,
      Emitter<OrdersState> emit) async {
    try {
      emit(LoadingOrderState());

      final resp =
          await ordersController.updateOrderStatusDelivered(event.idOrder);

      await Future.delayed(const Duration(milliseconds: 450));

      if (resp.resp) {
        emit(SuccessOrdersState());
      } else {
        emit(FailureOrdersState(resp.msg));
      }
    } catch (e) {
      emit(FailureOrdersState(e.toString()));
    }
  }

  Future<void> _onUpdateStatusOrderCancelled(
      OnUpdateStatusOrderCancelledEvent event,
      Emitter<OrdersState> emit) async {
    try {
      emit(LoadingOrderState());

      final resp =
          await ordersController.updateOrderStatusCancelled(event.idOrder);

      await Future.delayed(const Duration(milliseconds: 450));

      if (resp.resp) {
        emit(SuccessOrdersState());
      } else {
        emit(FailureOrdersState(resp.msg));
      }
    } catch (e) {
      emit(FailureOrdersState(e.toString()));
    }
  }
}
