import 'dart:convert';

import 'package:cenafoodie/src/data/models/entities/order/order_detail.dart';

OrderDetailResponse orderProductsResponseFromJson(String str) =>
    OrderDetailResponse.fromJson(json.decode(str));

String orderProductsResponseToJson(OrderDetailResponse data) =>
    json.encode(data.toJson());

class OrderDetailResponse {
  List<OrderDetail> orders;

  OrderDetailResponse({
    required this.orders,
  });

  factory OrderDetailResponse.fromJson(Map<String, dynamic> json) =>
      OrderDetailResponse(
        orders: List<OrderDetail>.from(
            json["order_details"].map((x) => OrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "order_details": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}
