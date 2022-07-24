import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/product_cart.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> with HydratedMixin {
  CartBloc()
      : super(const CartState(
            amount: 0, quantity: 0, quantityCart: 0, total: 0)) {
    on<OnIncreaseProductQuantityEvent>(_onIncreaseProductQuantity);
    on<OnDecreaseProductQuantityEvent>(_onDecreaseProductQuantity);
    on<OnResetQuantityEvent>(_onResetQuantity);
    on<OnClearQuantityEvent>(_onCleanQuantity);
    on<OnAddProductToCartEvent>(_onAddProductToCart);
    on<OnDeleteProductToCartEvent>(_onDeleteProductToCart);
    on<OnIncreaseQuantityProductToCartEvent>(_onIncrementQuantityProductToCard);
    on<OnDecreaseProductQuantityToCartEvent>(_onDecreaseQuantityProductToCart);
    on<OnDeleteProductToCartByIdEvent>(_onDeleteProductToCartById);
    on<OnIncreaseQuantityProductToCartByIdEvent>(
        _onIncrementQuantityProductToCardById);
    on<OnDecreaseProductQuantityToCartByIdEvent>(
        _onDecreaseQuantityProductToCartById);
    on<OnClearCartEvent>(_onClearCart);
  }

  List<ProductCart> product = [];

  Future<void> _onIncreaseProductQuantity(
      OnIncreaseProductQuantityEvent event, Emitter<CartState> emit) async {
    emit(state.incrementProduct(event.uidProduct, event.storeId));
  }

  Future<void> _onDecreaseProductQuantity(
      OnDecreaseProductQuantityEvent event, Emitter<CartState> emit) async {
    try {
      final verify = product.firstWhere((pro) =>
          pro.uidProduct.contains(event.uidProduct) &&
          pro.storeId == event.storeId);

      if (verify.quantity == 1) {
        product.remove(verify);
      } else {
        emit(state.decrementProduct(event.uidProduct, event.storeId));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _onResetQuantity(
      OnResetQuantityEvent event, Emitter<CartState> emit) async {
    try {
      final verify = product.firstWhere((pro) =>
          pro.uidProduct.contains(event.uidProduct) &&
          pro.storeId == event.storeId);

      verify.quantity = event.firstcount;
      _updateCart(emit);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _onAddProductToCart(
      OnAddProductToCartEvent event, Emitter<CartState> emit) async {
    try {
      state.copyWith(storeId: event.storeId);
      final verify = product.where((pro) =>
          pro.uidProduct.contains(event.productCart.uidProduct) &&
          pro.storeId == event.storeId);
      if (event.productCart.quantity > 0) {
        if (verify.isEmpty) {
          product.add(event.productCart);
          _updateCart(emit);
        }
      } else {
        if (verify.isNotEmpty) {
          product.remove(event.productCart);
          _updateCart(emit);
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _onDeleteProductToCart(
      OnDeleteProductToCartEvent event, Emitter<CartState> emit) async {
    product.removeAt(event.index);
    _updateCart(emit);
  }

  Future<void> _onCleanQuantity(
      OnClearQuantityEvent event, Emitter<CartState> emit) async {
    try {
      final verify = product.firstWhere((pro) =>
          pro.uidProduct.contains(event.uidProduct) &&
          pro.storeId == event.storeId);
      product.remove(verify);
      _updateCart(emit);
    } catch (e) {
      _updateCart(emit);
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> _onIncrementQuantityProductToCard(
      OnIncreaseQuantityProductToCartEvent event,
      Emitter<CartState> emit) async {
    product[event.plus].quantity++;
    _updateCart(emit);
  }

  Future<void> _onDecreaseQuantityProductToCart(
      OnDecreaseProductQuantityToCartEvent event,
      Emitter<CartState> emit) async {
    product[event.subtract].quantity--;
    _updateCart(emit);
  }

  Future<void> _onClearCart(
      OnClearCartEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(
        storeId: -1,
        amount: 0,
        quantity: 0,
        products: [],
        quantityCart: 0,
        total: 0.0));
  }

  Future<void> _onDeleteProductToCartById(
      OnDeleteProductToCartByIdEvent event, Emitter<CartState> emit) async {
    product.removeWhere((e) => e.uidProduct == event.productId);
    _updateCart(emit);
  }

  Future<void> _onIncrementQuantityProductToCardById(
      OnIncreaseQuantityProductToCartByIdEvent event,
      Emitter<CartState> emit) async {
    try {
      product
          .firstWhere((element) => element.uidProduct == event.productId)
          .quantity++;
      _updateCart(emit);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> _onDecreaseQuantityProductToCartById(
      OnDecreaseProductQuantityToCartByIdEvent event,
      Emitter<CartState> emit) async {
    try {
      product
          .firstWhere((element) => element.uidProduct == event.productId)
          .quantity--;
      _updateCart(emit);
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> _updateCart(Emitter<CartState> emit) async {
    double total = 0.00;
    int quantity = 0;
    int itemQuantity = 0;
    for (var p in product) {
      total = total + p.price * p.quantity;
      quantity = p.quantity + quantity;
      itemQuantity++;
    }

    emit(state.copyWith(
        products: product,
        quantity: quantity,
        quantityCart: itemQuantity,
        total: total.abs()));
  }

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    return CartState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    // addError(Exception("Couldn't write to storage!"), StackTrace.current);
    return state.toMap();
  }
}
