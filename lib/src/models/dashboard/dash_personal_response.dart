import 'dart:convert';

import 'package:cenafoodie/models/dashboard/dashboard_personal.dart';

DashboardPersonalResponse categoryAllResponseFromJson(String str) =>
    DashboardPersonalResponse.fromJson(json.decode(str));

String categoryAllResponseToJson(DashboardPersonalResponse data) =>
    json.encode(data.toJson());

class DashboardPersonalResponse {
  bool resp;
  String msg;
  List<DashboardPersonal> dashboardPersonal;

  DashboardPersonalResponse({
    required this.resp,
    required this.msg,
    required this.dashboardPersonal,
  });

  factory DashboardPersonalResponse.fromJson(Map<String, dynamic> json) =>
      DashboardPersonalResponse(
          resp: json["resp"],
          msg: json["msg"],
          dashboardPersonal: List<DashboardPersonal>.from(
              json["dashboardByPersonal"]
                  .map((x) => DashboardPersonal.fromJson(x))).toList());

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "dashboardByPersonal":
            List<dynamic>.from(dashboardPersonal.map((x) => x.toJson())),
      };
}
