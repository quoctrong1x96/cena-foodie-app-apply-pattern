import 'dart:convert';

ResponseAddNewOrder responseAddNewOrderFromJson(String str) =>
    ResponseAddNewOrder.fromJson(json.decode(str));

String responseAddNewOrderToJson(ResponseAddNewOrder data) =>
    json.encode(data.toJson());

class ResponseAddNewOrder {
  bool resp;
  String msg;
  int orderId;

  ResponseAddNewOrder({
    required this.resp,
    required this.msg,
    required this.orderId,
  });

  factory ResponseAddNewOrder.fromJson(Map<String, dynamic> json) =>
      ResponseAddNewOrder(
          resp: json["resp"], msg: json["msg"], orderId: json["orderId"]);

  Map<String, dynamic> toJson() =>
      {"resp": resp, "msg": msg, "orderId": orderId.toString()};
}
