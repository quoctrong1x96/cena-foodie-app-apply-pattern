import 'dart:convert';

import 'package:cenafoodie/models/dashboard/dashboard_status.dart';

DashboardStatusResponse categoryAllResponseFromJson(String str) =>
    DashboardStatusResponse.fromJson(json.decode(str));

String categoryAllResponseToJson(DashboardStatusResponse data) =>
    json.encode(data.toJson());

class DashboardStatusResponse {
  bool resp;
  String msg;
  DashboardStatus? dashboardByStatus;

  DashboardStatusResponse({
    required this.resp,
    required this.msg,
    required this.dashboardByStatus,
  });

  factory DashboardStatusResponse.fromJson(Map<String, dynamic> json) =>
      DashboardStatusResponse(
        resp: json["resp"],
        msg: json["msg"],
        dashboardByStatus: json["dashboardByStatus"] is List<dynamic>
            ? null
            : DashboardStatus.fromJson(json["dashboardByStatus"]),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "dashboardByStatus": dashboardByStatus!.toJson(),
      };
}
