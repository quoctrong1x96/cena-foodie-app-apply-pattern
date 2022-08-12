import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

import '../../../data/app_locator.dart';
import '../../../data/models/entities/cart/cart.dart';
import '../../../data/services/entities/order_service.dart';
import '../../../data/services/entities/store_service.dart';
import '../../../data/services/google/push_notification.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final _orderService = locator<IOrderService>();
  final _storeService = locator<IStoreService>();

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

      final uiResponse = await _orderService.add(
          addressId: event.uidAddress,
          total: event.total,
          typePayment: event.typePayment,
          carts: event.products);

      if (!uiResponse.hasError) {
        final listTokens =
            await _storeService.getAdminToken(storeId: event.storeId);

        Map<String, dynamic> data = {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK'
        };
        NumberFormat numberFormat = NumberFormat('###,###', 'en_US');
        await pushNotification.sendNotification(
            listTokens.data!,
            data,
            'Order #${uiResponse.data!.id}',
            'Tổng đơn: ${numberFormat.format((event.total).toInt()).toString()} vnđ, Hình thức thanh toán: ${event.typePayment}');

        emit(SuccessOrdersState());
      } else {
        emit(FailureOrdersState(uiResponse.errorMessage!));
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

      final uiResponse = await _orderService.toDispatch(
          orderId: event.idOrder,
          deliveryId: event.idDelivery,
          storeId: event.storeId,
          storeLat: event.storeLatitude,
          storeLng: event.storeLongitude);

      await Future.delayed(const Duration(seconds: 1));

      if (!uiResponse.hasError) {
        Map<String, dynamic> data = {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK'
        };

        await pushNotification.sendNotification(event.notificationTokenDelivery,
            data, 'Assigned order', 'New order assigned');

        emit(SuccessOrdersState());
      } else {
        emit(FailureOrdersState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureOrdersState(e.toString()));
    }
  }

  Future<void> _onUpdateStatusOrderOnWay(
      OnUpdateStatusOrderOnWayEvent event, Emitter<OrdersState> emit) async {
    try {
      emit(LoadingOrderState());

      final uiResponse = await _orderService.toOnWay(
          orderId: event.idOrder,
          desLat: event.locationDelivery.latitude.toString(),
          desLng: event.locationDelivery.longitude.toString());

      await Future.delayed(const Duration(seconds: 1));

      if (!uiResponse.hasError) {
        emit(SuccessOrdersState());
      } else {
        emit(FailureOrdersState(uiResponse.errorMessage!));
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

      final uiResponse =
          await _orderService.toDelivered(orderId: event.idOrder);

      await Future.delayed(const Duration(milliseconds: 450));

      if (!uiResponse.hasError) {
        emit(SuccessOrdersState());
      } else {
        emit(FailureOrdersState(uiResponse.errorMessage!));
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

      final uiResponse =
          await _orderService.toCancelled(orderId: event.idOrder);

      await Future.delayed(const Duration(milliseconds: 450));

      if (!uiResponse.hasError) {
        emit(SuccessOrdersState());
      } else {
        emit(FailureOrdersState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureOrdersState(e.toString()));
    }
  }
}
