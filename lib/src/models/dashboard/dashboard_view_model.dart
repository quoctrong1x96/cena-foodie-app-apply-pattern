import 'dart:convert';

import '../../controllers/dashboard_controller.dart';
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
  List<DashboardDelivered>? dashboardDelivereds;
  DashboardPayType? dashboardPayType;
  List<DashboardPersonal>? dashboardPersonal;
  List<DashboardProduct>? dashboardProducts;

  DashboardView(
      {required this.storeId,
      this.storeName,
      this.dashboardStatus,
      this.dashboardDelivereds,
      this.dashboardPayType,
      this.dashboardPersonal,
      this.dashboardProducts});

  factory DashboardView.fromJson(Map<String, dynamic> json) => DashboardView(
        storeId: json["store_id"],
        storeName: json["store_name"],
        dashboardStatus: DashboardStatus.fromJson(json["dashboardByStatus"]),
        dashboardDelivereds: List<DashboardDelivered>.from(
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
            List<dynamic>.from(dashboardDelivereds!.map((x) => x.toJson())),
        "dashboardPayType": dashboardPayType!.toJson(),
        "dashboardByPersonal":
            List<dynamic>.from(dashboardPersonal!.map((x) => x.toJson())),
        "dashboardProduct":
            List<dynamic>.from(dashboardProducts!.map((x) => x.toJson())),
      };
  Future<void> updateAll(TypeOfTime typeOfTime, int storeId,
      String timeFormatDDmmYYYY, int page) async {
    dashboardDelivereds =
        (await dashboardController.getDashboardDeliveredByType(
            typeOfTime, storeId, timeFormatDDmmYYYY, page));
    dashboardPayType = (await dashboardController.getDashboardPaymentByType(
        typeOfTime, storeId, timeFormatDDmmYYYY));
    dashboardStatus = (await dashboardController.getDashboardStatusByType(
        typeOfTime, storeId, timeFormatDDmmYYYY));
    dashboardPersonal = (await dashboardController.getDashboardPersonalByType(
        typeOfTime, storeId, timeFormatDDmmYYYY));
    dashboardProducts = (await dashboardController.getDashboardProductByType(
        typeOfTime, storeId, timeFormatDDmmYYYY));
  }

  Future<void> updateDashboardDelivereds(TypeOfTime typeOfTime, int storeId,
      String timeFormatDDmmYYYY, int page) async {
    dashboardDelivereds =
        (await dashboardController.getDashboardDeliveredByType(
            typeOfTime, storeId, timeFormatDDmmYYYY, page))!;
  }

  Future<void> updateDashboardProducts(
      TypeOfTime typeOfTime, int storeId, String timeFormatDDmmYYYY) async {
    dashboardProducts = (await dashboardController.getDashboardProductByType(
        typeOfTime, storeId, timeFormatDDmmYYYY))!;
  }

  Future<void> updateDashboardPayType(
      TypeOfTime typeOfTime, int storeId, String timeFormatDDmmYYYY) async {
    dashboardPayType = (await dashboardController.getDashboardPaymentByType(
        typeOfTime, storeId, timeFormatDDmmYYYY))!;
  }

  Future<void> updateDashboardStatus(
      TypeOfTime typeOfTime, int storeId, String timeFormatDDmmYYYY) async {
    dashboardStatus = (await dashboardController.getDashboardStatusByType(
        typeOfTime, storeId, timeFormatDDmmYYYY))!;
  }

  Future<void> updateDashboardPersonal(
      TypeOfTime typeOfTime, int storeId, String timeFormatDDmmYYYY) async {
    dashboardPersonal = (await dashboardController.getDashboardPersonalByType(
        typeOfTime, storeId, timeFormatDDmmYYYY))!;
  }
}
