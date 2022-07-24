import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../helpers/secure_storage.dart';
import '../models/dashboard/dash_delivered_response.dart';
import '../models/dashboard/dash_payment_response.dart';
import '../models/dashboard/dash_personal_response.dart';
import '../models/dashboard/dash_product_response.dart';
import '../models/dashboard/dash_status_response.dart';
import '../models/dashboard/dashboard_delivered.dart';
import '../models/dashboard/dashboard_pay_type.dart';
import '../models/dashboard/dashboard_personal.dart';
import '../models/dashboard/dashboard_product.dart';
import '../models/dashboard/dashboard_status.dart';
import '../services/url.dart';

enum TypeOfTime { date, month, year, allTime, fromTo }

class DashboardController {
  Future<DashboardStatus?> getDashboardStatusByType(
      TypeOfTime typeOfTime, int storeId, String timeFormatDDmmYYYY) async {
    try {
      final token = await secureStorage.readToken();
      String apiType = "";
      switch (typeOfTime) {
        case TypeOfTime.date:
          apiType = "DATE";
          break;
        case TypeOfTime.month:
          apiType = "MONTH";
          break;
        case TypeOfTime.year:
          apiType = "YEAR";
          break;
        case TypeOfTime.allTime:
          apiType = "ALL_TIME";
          break;
        default:
      }
      final response = await http
          .get(Uri.parse('${URLS.URL_API}/v1/dashboard/status'), headers: {
        'Accept': 'application/json',
        'xx-token': token!,
        'type': apiType,
        'store_id': storeId.toString(),
        'time': timeFormatDDmmYYYY
      });

      return DashboardStatusResponse.fromJson(jsonDecode(response.body))
          .dashboardByStatus;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<DashboardPayType?> getDashboardPaymentByType(
      TypeOfTime typeOfTime, int storeId, String timeFormatDDmmYYYY) async {
    try {
      final token = await secureStorage.readToken();
      String apiType = "";
      switch (typeOfTime) {
        case TypeOfTime.date:
          apiType = "DATE";
          break;
        case TypeOfTime.month:
          apiType = "MONTH";
          break;
        case TypeOfTime.year:
          apiType = "YEAR";
          break;
        case TypeOfTime.allTime:
          apiType = "ALL_TIME";
          break;
        default:
      }
      final response = await http.get(
          Uri.parse('${URLS.URL_API}/v1/dashboard/get-dashboard-by-pay-type'),
          headers: {
            'Accept': 'application/json',
            'xx-token': token!,
            'type': apiType,
            'store_id': storeId.toString(),
            'time': timeFormatDDmmYYYY
          });

      return DashboardPaymentResponse.fromJson(jsonDecode(response.body))
          .dashboardByPayment;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<List<DashboardDelivered>?> getDashboardDeliveredByType(
      TypeOfTime typeOfTime,
      int storeId,
      String timeFormatDDmmYYYY,
      int page) async {
    try {
      final token = await secureStorage.readToken();
      String apiType = "";
      switch (typeOfTime) {
        case TypeOfTime.date:
          apiType = "DATE";
          break;
        case TypeOfTime.month:
          apiType = "MONTH";
          break;
        case TypeOfTime.year:
          apiType = "YEAR";
          break;
        case TypeOfTime.allTime:
          apiType = "ALL_TIME";
          break;
        default:
      }
      final response = await http.get(
          Uri.parse('${URLS.URL_API}/v1/dashboard/get-dashboard-by-delivered'),
          headers: {
            'Accept': 'application/json',
            'xx-token': token!,
            'type': apiType,
            'store_id': storeId.toString(),
            'page': page.toString(),
            'time': timeFormatDDmmYYYY
          });

      return DashboardDeliveredResponse.fromJson(jsonDecode(response.body))
          .dashboardDelivered;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<List<DashboardPersonal>?> getDashboardPersonalByType(
      TypeOfTime typeOfTime, int storeId, String timeFormatDDmmYYYY) async {
    try {
      final token = await secureStorage.readToken();
      String apiType = "";
      switch (typeOfTime) {
        case TypeOfTime.date:
          apiType = "DATE";
          break;
        case TypeOfTime.month:
          apiType = "MONTH";
          break;
        case TypeOfTime.year:
          apiType = "YEAR";
          break;
        case TypeOfTime.allTime:
          apiType = "ALL_TIME";
          break;
        default:
      }
      final response = await http.get(
          Uri.parse('${URLS.URL_API}/v1/dashboard/get-dashboard-by-personal'),
          headers: {
            'Accept': 'application/json',
            'xx-token': token!,
            'type': apiType,
            'store_id': storeId.toString(),
            'time': timeFormatDDmmYYYY
          });

      return DashboardPersonalResponse.fromJson(jsonDecode(response.body))
          .dashboardPersonal;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<List<DashboardProduct>?> getDashboardProductByType(
      TypeOfTime typeOfTime, int storeId, String timeFormatDDmmYYYY) async {
    try {
      final token = await secureStorage.readToken();
      String apiType = "";
      switch (typeOfTime) {
        case TypeOfTime.date:
          apiType = "DATE";
          break;
        case TypeOfTime.month:
          apiType = "MONTH";
          break;
        case TypeOfTime.year:
          apiType = "YEAR";
          break;
        case TypeOfTime.allTime:
          apiType = "ALL_TIME";
          break;
        default:
      }
      final response = await http.get(
          Uri.parse('${URLS.URL_API}/v1/dashboard/get-dashboard-by-product'),
          headers: {
            'Accept': 'application/json',
            'xx-token': token!,
            'type': apiType,
            'store_id': storeId.toString(),
            'time': timeFormatDDmmYYYY
          });

      return DashboardProductResponse.fromJson(jsonDecode(response.body))
          .dashboardProducts;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}

final dashboardController = DashboardController();
