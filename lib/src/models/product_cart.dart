import 'dart:convert';

class ProductCart {
  int storeId;
  String uidProduct;
  String imageProduct;
  String nameProduct;
  double price;
  int quantity;
  ProductCart({
    required this.storeId,
    required this.uidProduct,
    required this.imageProduct,
    required this.nameProduct,
    required this.price,
    required this.quantity,
  });

  // ProductCart(
  //     {required this.storeId,
  //     required this.uidProduct,
  //     required this.imageProduct,
  //     required this.nameProduct,
  //     required this.price,
  //     required this.quantity});

  // Map<String, dynamic> toJson() {
  //   return {
  //     "store_id": storeId,
  //     "uidProduct": uidProduct,
  //     "price": price,
  //     "quantity": quantity
  //   };
  // }

  ProductCart copyWith({
    int? storeId,
    String? uidProduct,
    String? imageProduct,
    String? nameProduct,
    double? price,
    int? quantity,
  }) {
    return ProductCart(
      storeId: storeId ?? this.storeId,
      uidProduct: uidProduct ?? this.uidProduct,
      imageProduct: imageProduct ?? this.imageProduct,
      nameProduct: nameProduct ?? this.nameProduct,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'storeId': storeId});
    result.addAll({'uidProduct': uidProduct});
    result.addAll({'imageProduct': imageProduct});
    result.addAll({'nameProduct': nameProduct});
    result.addAll({'price': price});
    result.addAll({'quantity': quantity});

    return result;
  }

  factory ProductCart.fromMap(Map<String, dynamic> map) {
    return ProductCart(
      storeId: map['storeId']?.toInt() ?? 0,
      uidProduct: map['uidProduct'] ?? '',
      imageProduct: map['imageProduct'] ?? '',
      nameProduct: map['nameProduct'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      quantity: map['quantity']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductCart.fromJson(String source) =>
      ProductCart.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductCart(storeId: $storeId, uidProduct: $uidProduct, imageProduct: $imageProduct, nameProduct: $nameProduct, price: $price, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductCart &&
        other.storeId == storeId &&
        other.uidProduct == uidProduct &&
        other.imageProduct == imageProduct &&
        other.nameProduct == nameProduct &&
        other.price == price &&
        other.quantity == quantity;
  }

  @override
  int get hashCode {
    return storeId.hashCode ^
        uidProduct.hashCode ^
        imageProduct.hashCode ^
        nameProduct.hashCode ^
        price.hashCode ^
        quantity.hashCode;
  }
}
