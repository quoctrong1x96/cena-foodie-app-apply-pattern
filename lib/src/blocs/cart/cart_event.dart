part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class OnIncreaseProductQuantityEvent extends CartEvent {
  final String uidProduct;
  final int storeId;
  OnIncreaseProductQuantityEvent(this.uidProduct, this.storeId);
}

class OnDecreaseProductQuantityEvent extends CartEvent {
  final String uidProduct;
  final int storeId;
  OnDecreaseProductQuantityEvent(this.uidProduct, this.storeId);
}

class OnResetQuantityEvent extends CartEvent {
  final String uidProduct;
  final int storeId;
  final int firstcount;
  OnResetQuantityEvent(this.uidProduct, this.storeId, this.firstcount);
}

class OnClearQuantityEvent extends CartEvent {
  final String uidProduct;
  final int storeId;
  OnClearQuantityEvent(this.uidProduct, this.storeId);
}

class OnAddProductToCartEvent extends CartEvent {
  final ProductCart productCart;
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
  final String productId;

  OnDeleteProductToCartByIdEvent(this.productId);
}

class OnIncreaseQuantityProductToCartByIdEvent extends CartEvent {
  final String productId;

  OnIncreaseQuantityProductToCartByIdEvent(this.productId);
}

class OnDecreaseProductQuantityToCartByIdEvent extends CartEvent {
  final String productId;

  OnDecreaseProductQuantityToCartByIdEvent(this.productId);
}

class OnClearCartEvent extends CartEvent {}
