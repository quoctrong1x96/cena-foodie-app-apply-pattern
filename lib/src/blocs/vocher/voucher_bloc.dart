import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

import '../../controllers/orders_controller.dart';
import '../../models/product_cart.dart';

part 'voucher_event.dart';
part 'voucher_state.dart';

class VoucherBloc extends Bloc<VoucherEvent, VoucherState> {
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

      final resp = await ordersController.addNewOrders(
          event.uidAddress, event.total, event.typePayment, event.products);

      if (resp.resp) {
        // await pushNotification.sendNotificationMultiple(
        //     listTokens, data, 'Successful purchase', 'You have a new order');

        emit(SuccessVoucherState());
      } else {
        emit(FailureVoucherState(resp.msg));
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

      final resp = await ordersController.updateOrderStatusOnWay(
          event.idOrder,
          event.locationDelivery.latitude.toString(),
          event.locationDelivery.longitude.toString());

      await Future.delayed(const Duration(seconds: 1));

      if (resp.resp) {
        emit(SuccessVoucherState());
      } else {
        emit(FailureVoucherState(resp.msg));
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

      final resp =
          await ordersController.updateOrderStatusDelivered(event.idOrder);

      await Future.delayed(const Duration(milliseconds: 450));

      if (resp.resp) {
        emit(SuccessVoucherState());
      } else {
        emit(FailureVoucherState(resp.msg));
      }
    } catch (e) {
      emit(FailureVoucherState(e.toString()));
    }
  }
}
