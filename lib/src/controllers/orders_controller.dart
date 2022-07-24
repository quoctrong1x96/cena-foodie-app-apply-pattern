import 'dart:convert';

import 'package:http/http.dart' as http;

import '../helpers/secure_storage.dart';
import '../models/product_cart.dart';
import '../models/response/order_details_response.dart';
import '../models/response/orders_by_status_response.dart';
import '../models/response/orders_client_response.dart';
import '../models/response/response_add_new_order.dart';
import '../models/response/response_default.dart';
import '../services/url.dart';

class OrdersController {
  final String orderApiSource = '${URLS.URL_API}/v1/orders';
  Future<ResponseAddNewOrder> addNewOrders(int addressId, double total,
      String typePayment, List<ProductCart> products) async {
    final token = await secureStorage.readToken();

    Map<String, dynamic> data = {
      "uidAddress": addressId,
      "typePayment": typePayment,
      "total": total,
      "products": products
    };

    final body = json.encode(data);

    final resp = await http.post(Uri.parse('$orderApiSource/'),
        headers: {'Content-type': 'application/json', 'xx-token': token!},
        body: body);

    return ResponseAddNewOrder.fromJson(jsonDecode(resp.body));
  }

  Future<List<OrdersResponse>?> getOrdersByStatus(
      int storeId, String status) async {
    final token = await secureStorage.readToken();

    final resp = await http.get(
      Uri.parse('$orderApiSource?status=$status&store=$storeId'),
      headers: {'Accept': 'application/json', 'xx-token': token!},
    );

    return OrdersByStatusResponse.fromJson(jsonDecode(resp.body))
        .ordersResponse;
  }

  Future<List<DetailsOrder>?> getOrderDetailsById(String idOrder) async {
    final token = await secureStorage.readToken();

    final resp = await http.get(
      Uri.parse('$orderApiSource/$idOrder/details'),
      headers: {'Accept': 'application/json', 'xx-token': token!},
    );

    return OrderDetailsResponse.fromJson(jsonDecode(resp.body)).detailsOrder;
  }

  Future<ResponseDefault> updateStatusOrderToDispatched(String idOrder,
      String idDelivery, int storeId, String storeLat, String storeLong) async {
    final token = await secureStorage.readToken();

    final resp = await http
        .put(Uri.parse('$orderApiSource/$idOrder/to-dispatched'), headers: {
      'Accept': 'application/json',
      'xx-token': token!
    }, body: {
      'idDelivery': idDelivery,
      'store_id': storeId.toString(),
      'store_latitude': storeLat,
      'store_longitude': storeLong
    });

    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }

  Future<ResponseDefault> updateOrderStatusOnWay(
      String idOrder, String latitude, String longitude) async {
    final token = await secureStorage.readToken();

    final resp = await http.put(Uri.parse('$orderApiSource/$idOrder/to-on-way'),
        headers: {'Accept': 'application/json', 'xx-token': token!},
        body: {'latitude': latitude, 'longitude': longitude});

    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }

  Future<ResponseDefault> updateOrderStatusDelivered(String idOrder) async {
    final token = await secureStorage.readToken();

    final resp = await http.put(
      Uri.parse('$orderApiSource/$idOrder/to-delivered'),
      headers: {'Accept': 'application/json', 'xx-token': token!},
    );

    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }

  Future<ResponseDefault> updateOrderStatusCancelled(String idOrder) async {
    final token = await secureStorage.readToken();

    final resp = await http.put(
      Uri.parse('$orderApiSource/$idOrder/to-cancelled/'),
      headers: {'Accept': 'application/json', 'xx-token': token!},
    );

    return ResponseDefault.fromJson(jsonDecode(resp.body));
  }

  Future<List<OrdersClient>?> getListOrdersForClient(
      int userId, String status) async {
    final token = await secureStorage.readToken();

    final resp = await http.get(
        Uri.parse('$orderApiSource/clients/$userId?status=$status'),
        headers: {'Accept': 'application/json', 'xx-token': token!});

    return OrdersClientResponse.fromJson(jsonDecode(resp.body)).ordersClient;
  }
}

final ordersController = OrdersController();
