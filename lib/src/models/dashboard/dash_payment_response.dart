import 'dart:convert';

import 'package:cenafoodie/models/dashboard/dashboard_pay_type.dart';

DashboardPaymentResponse categoryAllResponseFromJson(String str) =>
    DashboardPaymentResponse.fromJson(json.decode(str));

String categoryAllResponseToJson(DashboardPaymentResponse data) =>
    json.encode(data.toJson());

class DashboardPaymentResponse {
  bool resp;
  String msg;
  DashboardPayType? dashboardByPayment;

  DashboardPaymentResponse({
    required this.resp,
    required this.msg,
    required this.dashboardByPayment,
  });

  factory DashboardPaymentResponse.fromJson(Map<String, dynamic> json) =>
      DashboardPaymentResponse(
        resp: json["resp"],
        msg: json["msg"],
        dashboardByPayment: json["dashboardByPayment"] is List<dynamic>
            ? null
            : DashboardPayType.fromJson(json["dashboardByPayment"]),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "dashboardByPayment": dashboardByPayment!.toJson(),
      };
}
