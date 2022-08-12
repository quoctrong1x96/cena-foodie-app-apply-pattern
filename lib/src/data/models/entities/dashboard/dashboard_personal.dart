class DashboardPersonal {
  int storeId;
  int userId;
  String userName;
  int quantity;
  int orders;
  int amount;

  DashboardPersonal(
      {required this.storeId,
      required this.userId,
      this.userName = "",
      this.quantity = 0,
      this.amount = 0,
      this.orders = 0});

  factory DashboardPersonal.fromJson(Map<String, dynamic> json) =>
      DashboardPersonal(
          storeId: json["store_id"],
          userId: json["user_id"],
          userName: json["user_name"],
          quantity: json["quantity"],
          amount: json["amount"],
          orders: json["orders"]);

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "user_id": userId,
        "user_name": userName,
        "quantity": quantity,
        "amount": amount,
        "orders": orders
      };
}
