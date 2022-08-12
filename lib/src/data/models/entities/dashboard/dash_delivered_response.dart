import 'dart:convert';

import 'dashboard_delivered.dart';

DashboardDeliveredResponse categoryAllResponseFromJson(String str) =>
    DashboardDeliveredResponse.fromJson(json.decode(str));

String categoryAllResponseToJson(DashboardDeliveredResponse data) =>
    json.encode(data.toJson());

class DashboardDeliveredResponse {
  bool resp;
  String msg;
  List<DashboardDelivered> dashboardDelivered;

  DashboardDeliveredResponse({
    required this.resp,
    required this.msg,
    required this.dashboardDelivered,
  });

  factory DashboardDeliveredResponse.fromJson(Map<String, dynamic> json) =>
      DashboardDeliveredResponse(
        resp: json["resp"],
        msg: json["msg"],
        dashboardDelivered: List<DashboardDelivered>.from(
            json["dashboardByDelivered"]
                .map((x) => DashboardDelivered.fromJson(x))).toList(),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "dashboardByDelivered":
            List<dynamic>.from(dashboardDelivered.map((x) => x.toJson())),
      };
}
