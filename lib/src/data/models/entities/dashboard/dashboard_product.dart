class DashboardProduct {
  int storeId;
  String storeName;
  int id;
  String productName;
  int liked;
  int viewer;
  int quantity;
  int amount;

  DashboardProduct(
      {required this.storeId,
      required this.storeName,
      required this.id,
      this.productName = "",
      this.liked = 0,
      this.viewer = 0,
      this.quantity = 0,
      this.amount = 0});

  factory DashboardProduct.fromJson(Map<String, dynamic> json) =>
      DashboardProduct(
          storeId: json["store_id"],
          storeName: json["user_id"],
          id: json["id"],
          productName: json["product_name"],
          liked: json["liked"],
          viewer: json["viewer"],
          quantity: json["quantity"],
          amount: json["amount"]);

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "user_id": storeName,
        "id": id,
        "product_name": productName,
        "orders": liked,
        "liked": viewer,
        "quantity": quantity,
        "amount": amount
      };
}
