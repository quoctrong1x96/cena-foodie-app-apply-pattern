import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helpers/secure_storage.dart';
import '../models/response/get_all_delivery_response.dart';
import '../models/response/orders_by_status_response.dart';
import '../services/url.dart';

class DeliveryController {
  Future<List<Delivery>?> getAllDelivery(int storeId) async {
    final token = await secureStorage.readToken();

    final resp = await http.get(
        Uri.parse('${URLS.URL_API}/v1/stores/$storeId/deliveries'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return GetAllDeliveryResponse.fromJson(jsonDecode(resp.body)).delivery;
  }

  Future<List<OrdersResponse>?> getOrdersForDelivery(
      int deliveryId, String statusOrder) async {
    final token = await secureStorage.readToken();

    final resp = await http.get(
        Uri.parse(
            '${URLS.URL_API}/v1/orders/deliveries/$deliveryId?status=$statusOrder'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return OrdersByStatusResponse.fromJson(jsonDecode(resp.body))
        .ordersResponse;
  }
}

final deliveryController = DeliveryController();
