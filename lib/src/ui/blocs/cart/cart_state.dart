part of 'cart_bloc.dart';

@immutable
class CartState {
  final int? storeId;
  final List<Cart>? products;
  final double total;
  final int amount;
  final int quantity;
  final int quantityCart;
  const CartState({
    this.storeId,
    this.products,
    required this.total,
    required this.amount,
    required this.quantity,
    required this.quantityCart,
  });

  // CartState copyWith(
  //         {List<ProductCart>? products,
  //         double? total,
  //         int? storeId,
  //         int? amount,
  //         int? quantity,
  //         int? quantityCart}) =>
  //     CartState(
  //         products: products ?? this.products,
  //         total: total ?? this.total,
  //         storeId: storeId ?? this.storeId,
  //         amount: amount ?? this.amount,
  //         quantity: quantity ?? this.quantity,
  //         quantityCart: quantityCart ?? this.quantityCart);
  CartState incrementProduct(int uidProduct, int storeId) {
    products!
        .firstWhere((e) => e.productId == uidProduct && e.storeId == storeId)
        .increament(inputQuantity: 1);
    return CartState(
        products: products,
        total: total,
        amount: amount,
        quantity: quantity,
        quantityCart: quantityCart);
  }

  CartState decrementProduct(int uidProduct, int storeId) {
    Cart productCart = products!
        .firstWhere((e) => e.productId == uidProduct && e.storeId == storeId);
    if (productCart.quantity > 0) {
      productCart.decrement(inputQuantity: 1);
    }
    if (productCart.quantity == 0) {
      clearProduct(uidProduct, storeId);
    }
    return CartState(
        products: products,
        total: total,
        amount: amount,
        quantity: quantity,
        quantityCart: quantityCart);
  }

  CartState clearProduct(int uidProduct, int storeId) {
    products!
        .removeWhere((e) => e.productId == uidProduct && e.storeId == storeId);
    return CartState(
        products: products,
        total: total,
        amount: amount,
        quantity: quantity,
        quantityCart: quantityCart);
  }

  CartState clearAllProduct() {
    products?.removeWhere((element) => true);
    return CartState(
        products: products, total: 0, amount: 0, quantity: 0, quantityCart: 0);
  }

  CartState copyWith({
    int? storeId,
    List<Cart>? products,
    double? total,
    int? amount,
    int? quantity,
    int? quantityCart,
  }) {
    return CartState(
      storeId: storeId ?? this.storeId,
      products: products ?? this.products,
      total: total ?? this.total,
      amount: amount ?? this.amount,
      quantity: quantity ?? this.quantity,
      quantityCart: quantityCart ?? this.quantityCart,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (storeId != null) {
      result.addAll({'storeId': storeId});
    }
    if (products != null) {
      result.addAll({'products': products!.map((x) => x.toJson()).toList()});
    }
    result.addAll({'total': total});
    result.addAll({'amount': amount});
    result.addAll({'quantity': quantity});
    result.addAll({'quantityCart': quantityCart});

    return result;
  }

  factory CartState.fromMap(Map<String, dynamic> map) {
    return CartState(
      storeId: map['storeId']?.toInt(),
      products: map['products'] != null
          ? List<Cart>.from(map['products']?.map((x) => Cart.fromJson(x)))
          : null,
      total: map['total']?.toDouble() ?? 0.0,
      amount: map['amount']?.toInt() ?? 0,
      quantity: map['quantity']?.toInt() ?? 0,
      quantityCart: map['quantityCart']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartState.fromJson(String source) =>
      CartState.fromMap(json.decode(source));
}
