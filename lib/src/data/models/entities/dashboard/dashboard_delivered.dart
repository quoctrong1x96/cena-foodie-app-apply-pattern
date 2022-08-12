class DashboardDelivered {
  int storeId;
  int orderId;
  int userId;
  String userName;
  String address;
  int quantity;
  int productCount;
  int amount;

  DashboardDelivered(
      {required this.storeId,
      required this.orderId,
      required this.userId,
      this.userName = "",
      this.address = "",
      this.quantity = 0,
      this.productCount = 0,
      this.amount = 0});

  factory DashboardDelivered.fromJson(Map<String, dynamic> json) =>
      DashboardDelivered(
        storeId: json["store_id"],
        orderId: json["order_id"],
        userId: json["user_id"],
        userName: json["user_name"],
        address: json["address"],
        quantity: json["quantity"],
        productCount: json["product_count"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "order_id": orderId,
        "user_id": userId,
        "user_name": userName,
        "address": address,
        "quantity": quantity,
        "product_count": productCount,
        "amount": amount,
      };
}
