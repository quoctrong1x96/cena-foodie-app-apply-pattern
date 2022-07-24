class DashboardStatus {
  int storeId;
  String storeName;
  int delivered;
  int deliveredAmount;
  int onway;
  int onwayAmount;
  int dispatched;
  int dispatchedAmount;
  int paidout;
  int paidoutAmount;
  int total;
  int totalAmount;

  DashboardStatus(
      {required this.storeName,
      required this.storeId,
      this.delivered = 0,
      this.deliveredAmount = 0,
      this.dispatched = 0,
      this.dispatchedAmount = 0,
      this.onway = 0,
      this.onwayAmount = 0,
      this.paidout = 0,
      this.paidoutAmount = 0,
      this.total = 0,
      this.totalAmount = 0});

  factory DashboardStatus.fromJson(Map<String, dynamic> json) =>
      DashboardStatus(
        storeId: json["store_id"] ?? 0,
        storeName: json["store_name"] ?? "",
        delivered: json["delivered"] ?? 0,
        deliveredAmount: json["delivered_amount"] ?? 0,
        dispatched: json["dispatched"] ?? 0,
        dispatchedAmount: json["dispatched_amount"] ?? 0,
        onway: json["onway"] ?? 0,
        onwayAmount: json["onway_amount"] ?? 0,
        paidout: json["paidout"] ?? 0,
        paidoutAmount: json["paidout_amount"] ?? 0,
        total: json["total"] ?? 0,
        totalAmount: json["total_amount"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "store_name": storeName,
        "delivered": delivered,
        "delivered_amount": deliveredAmount,
        "onway": onway,
        "onway_amount": onwayAmount,
        "dispatched": dispatched,
        "dispatched_amount": dispatchedAmount,
        "total": total,
        "total_amount": totalAmount,
      };
}
