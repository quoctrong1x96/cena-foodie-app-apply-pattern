import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import '../../../data/app_locator.dart';
import '../../../data/models/entities/cart/cart.dart';
import '../../../data/services/entities/order_service.dart';

part 'voucher_event.dart';
part 'voucher_state.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
  final _orderService = locator<IOrderService>();

  VoucherBloc() : super(VoucherState()) {
    on<OnAddNewVoucherEvent>(_onAddNewOrders);
    on<OnUpdateStatusOrderToDispatchedEvent>(_onUpdateStatusOrderToDispatched);
    on<OnUpdateStatusOrderOnWayEvent>(_onUpdateStatusOrderOnWay);
    on<OnUpdateStatusOrderDeliveredEvent>(_onUpdateStatusOrderDelivered);
  }

  Future<void> _onAddNewOrders(
      OnAddNewVoucherEvent event, Emitter<VoucherState> emit) async {
    try {
      emit(LoadingVoucherState());

      await Future.delayed(const Duration(milliseconds: 1500));

      final uiResponse = await _orderService.add(
          addressId: event.uidAddress,
          total: event.total,
          typePayment: event.typePayment,
          carts: event.products);

      if (!uiResponse.hasError) {
        // await pushNotification.sendNotificationMultiple(
        //     listTokens, data, 'Successful purchase', 'You have a new order');

        emit(SuccessVoucherState());
      } else {
        emit(FailureVoucherState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureVoucherState(e.toString()));
    }
  }

  Future<void> _onUpdateStatusOrderToDispatched(
      OnUpdateStatusOrderToDispatchedEvent event,
      Emitter<VoucherState> emit) async {
    try {
      emit(LoadingVoucherState());

      // final resp = await ordersController.updateStatusOrderToDispatched(
      //     event.idOrder, event.idDelivery);

      await Future.delayed(const Duration(seconds: 1));

      // if (resp.resp) {
      //   Map<String, dynamic> data = {
      //     'click_action': 'FLUTTER_NOTIFICATION_CLICK'
      //   };

      //   await pushNotification.sendNotification(event.notificationTokenDelivery,
      //       data, 'Assigned order', 'New order assigned');

      //   emit(SuccessVoucherState());
      // } else {
      //   emit(FailureVoucherState(resp.msg));
      // }
    } catch (e) {
      emit(FailureVoucherState(e.toString()));
    }
  }

  Future<void> _onUpdateStatusOrderOnWay(
      OnUpdateStatusOrderOnWayEvent event, Emitter<VoucherState> emit) async {
    try {
      emit(LoadingVoucherState());

      final uiResponse = await _orderService.toOnWay(
          orderId: event.idOrder,
          desLat: event.locationDelivery.latitude.toString(),
          desLng: event.locationDelivery.longitude.toString());

      await Future.delayed(const Duration(seconds: 1));

      if (!uiResponse.hasError) {
        emit(SuccessVoucherState());
      } else {
        emit(FailureVoucherState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureVoucherState(e.toString()));
    }
  }

  Future<void> _onUpdateStatusOrderDelivered(
      OnUpdateStatusOrderDeliveredEvent event,
      Emitter<VoucherState> emit) async {
    try {
      emit(LoadingVoucherState());

      final uiResponse =
          await _orderService.toDelivered(orderId: event.idOrder);

      await Future.delayed(const Duration(milliseconds: 450));

      if (!uiResponse.hasError) {
        emit(SuccessVoucherState());
      } else {
        emit(FailureVoucherState(uiResponse.errorMessage!));
      }
    } catch (e) {
      emit(FailureVoucherState(e.toString()));
    }
  }
}
