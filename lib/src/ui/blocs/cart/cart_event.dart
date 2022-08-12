part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class OnIncreaseProductQuantityEvent extends CartEvent {
  final int productId;
  final int storeId;
  OnIncreaseProductQuantityEvent(this.productId, this.storeId);
}

class OnDecreaseProductQuantityEvent extends CartEvent {
  final int productId;
  final int storeId;
  OnDecreaseProductQuantityEvent(this.productId, this.storeId);
}

class OnResetQuantityEvent extends CartEvent {
  final int productId;
  final int storeId;
  final int firstcount;
  OnResetQuantityEvent(this.productId, this.storeId, this.firstcount);
}

class OnClearQuantityEvent extends CartEvent {
  final int productId;
  final int storeId;
  OnClearQuantityEvent(this.productId, this.storeId);
}

class OnAddProductToCartEvent extends CartEvent {
  final Cart productCart;
  final int storeId;

  OnAddProductToCartEvent(this.productCart, this.storeId);
}

class OnDeleteProductToCartEvent extends CartEvent {
  final int index;

  OnDeleteProductToCartEvent(this.index);
}

class OnIncreaseQuantityProductToCartEvent extends CartEvent {
  final int plus;

  OnIncreaseQuantityProductToCartEvent(this.plus);
}

class OnDecreaseProductQuantityToCartEvent extends CartEvent {
  final int subtract;

  OnDecreaseProductQuantityToCartEvent(this.subtract);
}

class OnDeleteProductToCartByIdEvent extends CartEvent {
  final int productId;

  OnDeleteProductToCartByIdEvent(this.productId);
}

class OnIncreaseQuantityProductToCartByIdEvent extends CartEvent {
  final int productId;

  OnIncreaseQuantityProductToCartByIdEvent(this.productId);
}

class OnDecreaseProductQuantityToCartByIdEvent extends CartEvent {
  final int productId;

  OnDecreaseProductQuantityToCartByIdEvent(this.productId);
}

class OnClearCartEvent extends CartEvent {}
