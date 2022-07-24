part of 'cart_bloc.dart';

@immutable
class CartState {
  final int? storeId;
  final List<ProductCart>? products;
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
  CartState incrementProduct(String uidProduct, int storeId) {
    products!
        .firstWhere((e) => e.uidProduct == uidProduct && e.storeId == storeId)
        .quantity++;
    return CartState(
        products: products,
        total: total,
        amount: amount,
        quantity: quantity,
        quantityCart: quantityCart);
  }

  CartState decrementProduct(String uidProduct, int storeId) {
    ProductCart productCart = products!
        .firstWhere((e) => e.uidProduct == uidProduct && e.storeId == storeId);
    if (productCart.quantity > 0) {
      productCart.quantity--;
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

  CartState clearProduct(String uidProduct, int storeId) {
    products!
        .removeWhere((e) => e.uidProduct == uidProduct && e.storeId == storeId);
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
    List<ProductCart>? products,
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
      result.addAll({'products': products!.map((x) => x.toMap()).toList()});
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
          ? List<ProductCart>.from(
              map['products']?.map((x) => ProductCart.fromMap(x)))
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
