import 'dart:convert';

OrdersByStatusResponse ordersByStatusResponseFromJson(String str) =>
    OrdersByStatusResponse.fromJson(json.decode(str));

String ordersByStatusResponseToJson(OrdersByStatusResponse data) =>
    json.encode(data.toJson());

class OrdersByStatusResponse {
  bool? resp;
  String? msg;
  List<OrdersResponse>? ordersResponse;

  OrdersByStatusResponse({
    this.resp,
    this.msg,
    this.ordersResponse,
  });

  factory OrdersByStatusResponse.fromJson(Map<String, dynamic> json) =>
      OrdersByStatusResponse(
        resp: json["resp"],
        msg: json["msg"],
        ordersResponse: List<OrdersResponse>.from(
            json['data'].map((x) => OrdersResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "ordersResponse":
            List<dynamic>.from(ordersResponse!.map((x) => x.toJson())),
      };
}

class OrdersResponse {
  int? orderId;
  int? deliveryId;
  String? delivery;
  String? deliveryImage;
  int? clientId;
  String? client;
  String? clientImage;
  String? clientPhone;
  int? addressId;
  String? address;
  String? receiver;
  String? latitude;
  String? longitude;
  String? status;
  String? payType;
  double? amount;
  DateTime? currentDate;
  int? storeId;
  String? storeLatitude;
  String? storeLongitude;

  OrdersResponse(
      {this.orderId,
      this.deliveryId,
      this.delivery,
      this.deliveryImage,
      this.clientId,
      this.client,
      this.clientImage,
      this.clientPhone,
      this.addressId,
      this.address,
      this.receiver,
      this.latitude,
      this.longitude,
      this.status,
      this.payType,
      this.amount,
      this.currentDate,
      this.storeId,
      this.storeLatitude,
      this.storeLongitude});

  factory OrdersResponse.fromJson(Map<String, dynamic> json) => OrdersResponse(
        orderId: json["order_id"],
        deliveryId: json["delivery_id"] ?? 0,
        delivery: json["delivery"] ?? '',
        deliveryImage: json["deliveryImage"] ?? '',
        clientId: json["client_id"],
        client: json["client"],
        clientImage: json["clientImage"],
        clientPhone: json["clientPhone"] ?? '',
        addressId: json["address_id"],
        address: json["address"],
        receiver: json["receiver"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        status: json["status"],
        payType: json["pay_type"],
        storeId: json["store_id"],
        storeLatitude: json["store_latitude"],
        storeLongitude: json["store_longitude"],
        amount: json["amount"].toDouble(),
        currentDate: DateTime.parse(json["currentDate"]),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "delivery_id": deliveryId,
        "delivery": delivery,
        "deliveryImage": deliveryImage,
        "client_id": clientId,
        "client": client,
        "clientImage": clientImage,
        "clientPhone": clientPhone,
        "address_id": addressId,
        "address": address,
        "receiver": receiver,
        "Latitude": latitude,
        "Longitude": longitude,
        "status": status,
        "pay_type": payType,
        "amount": amount,
        "store_id": storeId,
        "store_latitude": storeLatitude,
        "store_longtitude": storeLongitude,
        "currentDate": currentDate!.toIso8601String(),
      };
}
