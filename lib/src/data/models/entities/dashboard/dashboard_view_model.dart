import 'dart:convert';

import '../../../app_locator.dart';
import '../../../services/entities/dashboard_service.dart';
import 'dashboard_delivered.dart';
import 'dashboard_pay_type.dart';
import 'dashboard_personal.dart';
import 'dashboard_product.dart';
import 'dashboard_status.dart';

DashboardView categoryAllResponseFromJson(String str) =>
    DashboardView.fromJson(json.decode(str));

String categoryAllResponseToJson(DashboardView data) =>
    json.encode(data.toJson());

class DashboardView {
  int storeId;
  String? storeName;
  DashboardStatus? dashboardStatus;
  List<DashboardDelivered>? dashboardDelivered;
  DashboardPayType? dashboardPayType;
  List<DashboardPersonal>? dashboardPersonal;
  List<DashboardProduct>? dashboardProducts;

  DashboardView(
      {required this.storeId,
      this.storeName,
      this.dashboardStatus,
      this.dashboardDelivered,
      this.dashboardPayType,
      this.dashboardPersonal,
      this.dashboardProducts});

  factory DashboardView.fromJson(Map<String, dynamic> json) => DashboardView(
        storeId: json["store_id"],
        storeName: json["store_name"],
        dashboardStatus: DashboardStatus.fromJson(json["dashboardByStatus"]),
        dashboardDelivered: List<DashboardDelivered>.from(
            json["dashboardDelivered"]
                .map((x) => DashboardDelivered.fromJson(x))).toList(),
        dashboardPayType: DashboardPayType.fromJson(json["dashboardPayType"]),
        dashboardPersonal: List<DashboardPersonal>.from(
            json["dashboardByPersonal"]
                .map((x) => DashboardPersonal.fromJson(x))).toList(),
        dashboardProducts: List<DashboardProduct>.from(
            json["dashboardByProduct"]
                .map((x) => DashboardProduct.fromJson(x))).toList(),
      );

  Map<String, dynamic> toJson() => {
        "store_id": storeId,
        "store_name": storeName,
        "dashboardByStatus": dashboardStatus?.toJson(),
        "dashboardDelivered":
            List<dynamic>.from(dashboardDelivered!.map((x) => x.toJson())),
        "dashboardPayType": dashboardPayType!.toJson(),
        "dashboardByPersonal":
            List<dynamic>.from(dashboardPersonal!.map((x) => x.toJson())),
        "dashboardProduct":
            List<dynamic>.from(dashboardProducts!.map((x) => x.toJson())),
      };
  Future<void> updateAll(TypeOfTime typeOfTime, int storeId,
      String timeFormatDDmmYYYY, int page) async {
    final IDashboardService dashboardService = locator<IDashboardService>();
    dashboardDelivered = (await dashboardService.deliveredByPeriod(
            typeOfTime: typeOfTime,
            storeId: storeId,
            timeFormatDDmmYYYY: timeFormatDDmmYYYY,
            page: page))
        .data;
    dashboardPayType = (await dashboardService.paymentByPeriod(
            typeOfTime: typeOfTime,
            storeId: storeId,
            timeFormatDDmmYYYY: timeFormatDDmmYYYY))
        .data;
    dashboardStatus = (await dashboardService.statusByPeriod(
            typeOfTime: typeOfTime,
            storeId: storeId,
            timeFormatDDmmYYYY: timeFormatDDmmYYYY))
        .data;
    dashboardPersonal = (await dashboardService.personalByPeriod(
            typeOfTime: typeOfTime,
            storeId: storeId,
            timeFormatDDmmYYYY: timeFormatDDmmYYYY))
        .data;
    dashboardProducts = (await dashboardService.productByPeriod(
            typeOfTime: typeOfTime,
            storeId: storeId,
            timeFormatDDmmYYYY: timeFormatDDmmYYYY))
        .data;
  }

  Future<void> updateDashboardDelivered(TypeOfTime typeOfTime, int storeId,
      String timeFormatDDmmYYYY, int page) async {
    final IDashboardService dashboardService = locator<IDashboardService>();
    dashboardDelivered = (await dashboardService.deliveredByPeriod(
            typeOfTime: typeOfTime,
            storeId: storeId,
            timeFormatDDmmYYYY: timeFormatDDmmYYYY,
            page: page))
        .data;
  }

  Future<void> updateDashboardProducts(
      TypeOfTime typeOfTime, int storeId, String timeFormatDDmmYYYY) async {
    final IDashboardService dashboardService = locator<IDashboardService>();
    dashboardProducts = (await dashboardService.productByPeriod(
            typeOfTime: typeOfTime,
            storeId: storeId,
            timeFormatDDmmYYYY: timeFormatDDmmYYYY))
        .data;
  }

  Future<void> updateDashboardPayType(
      TypeOfTime typeOfTime, int storeId, String timeFormatDDmmYYYY) async {
    final IDashboardService dashboardService = locator<IDashboardService>();
    dashboardPayType = (await dashboardService.paymentByPeriod(
            typeOfTime: typeOfTime,
            storeId: storeId,
            timeFormatDDmmYYYY: timeFormatDDmmYYYY))
        .data;
  }

  Future<void> updateDashboardStatus(
      TypeOfTime typeOfTime, int storeId, String timeFormatDDmmYYYY) async {
    final IDashboardService dashboardService = locator<IDashboardService>();
    dashboardStatus = (await dashboardService.statusByPeriod(
            typeOfTime: typeOfTime,
            storeId: storeId,
            timeFormatDDmmYYYY: timeFormatDDmmYYYY))
        .data;
  }

  Future<void> updateDashboardPersonal(
      TypeOfTime typeOfTime, int storeId, String timeFormatDDmmYYYY) async {
    final IDashboardService dashboardService = locator<IDashboardService>();
    dashboardPersonal = (await dashboardService.personalByPeriod(
            typeOfTime: typeOfTime,
            storeId: storeId,
            timeFormatDDmmYYYY: timeFormatDDmmYYYY))
        .data;
  }
}
