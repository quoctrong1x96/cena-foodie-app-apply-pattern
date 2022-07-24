class DashboardPayType {
  int storeId;
  String storeName;
  int cashPayment;
  int cashPaymentAmount;
  int cenafoodiePayment;
  int cenafoodiePaymentAmount;
  int creditCart;
  int creditCartAmount;
  int zaloPay;
  int zaloPayAmount;
  int total;
  int totalAmount;

  DashboardPayType({
    required this.storeId,
    required this.storeName,
    this.cashPayment = 0,
    this.cashPaymentAmount = 0,
    this.cenafoodiePayment = 0,
    this.cenafoodiePaymentAmount = 0,
    this.creditCart = 0,
    this.creditCartAmount = 0,
    this.zaloPay = 0,
    this.zaloPayAmount = 0,
    this.total = 0,
    this.totalAmount = 0,
  });

  factory DashboardPayType.fromJson(Map<String, dynamic> json) =>
      DashboardPayType(
        storeId: json["store_id"] ?? 0,
        storeName: json["store_name"] ?? "",
        cashPayment: json["cash_payment"] ?? 0,
        cashPaymentAmount: json["cash_payment_amount"] ?? 0,
        cenafoodiePayment: json["cenafoodie_payment"] ?? 0,
        cenafoodiePaymentAmount: json["cenafoodie_payment_amount"] ?? 0,
        creditCart: json["credit_card"] ?? 0,
        creditCartAmount: json["credit_card_amount"] ?? 0,
        zaloPay: json["zalopay"] ?? 0,
        zaloPayAmount: json["zalopay_amount"] ?? 0,
        total: json["total"] ?? 0,
        totalAmount: json["total_amount"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "store_name": storeName,
        "cash_payment": cashPayment,
        "cash_payment_amount": cashPaymentAmount,
        "cenafoodie_payment": cenafoodiePayment,
        "cenafoodie_payment_amount": cenafoodiePaymentAmount,
        "credit_card": creditCart,
        "credit_card_amount": creditCartAmount,
        "zalopay": zaloPay,
        "zalopay_amount": zaloPayAmount,
        "total": total,
        "total_amount": totalAmount,
      };
}
