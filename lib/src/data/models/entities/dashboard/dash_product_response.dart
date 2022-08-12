import 'dart:convert';

import 'dashboard_product.dart';

DashboardProductResponse categoryAllResponseFromJson(String str) =>
    DashboardProductResponse.fromJson(json.decode(str));

String categoryAllResponseToJson(DashboardProductResponse data) =>
    json.encode(data.toJson());

class DashboardProductResponse {
  bool resp;
  String msg;
  List<DashboardProduct> dashboardProducts;

  DashboardProductResponse({
    required this.resp,
    required this.msg,
    required this.dashboardProducts,
  });

  factory DashboardProductResponse.fromJson(Map<String, dynamic> json) =>
      DashboardProductResponse(
        resp: json["resp"],
        msg: json["msg"],
        dashboardProducts: List<DashboardProduct>.from(
            json["dashboardByProduct"]
                .map((x) => DashboardProduct.fromJson(x))).toList(),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "dashboardByProduct":
            List<dynamic>.from(dashboardProducts.map((x) => x.toJson())),
      };
}
