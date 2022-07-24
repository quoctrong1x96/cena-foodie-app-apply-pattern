import 'dart:convert';

import 'package:cenafoodie/models/store/store_model.dart';

StoreResponse storeResponseFromJson(String str) =>
    StoreResponse.fromJson(json.decode(str));

String storeResponseToJson(StoreResponse data) => json.encode(data.toJson());

class StoreResponse {
  bool resp;
  String msg;
  Store store;

  StoreResponse({
    required this.resp,
    required this.msg,
    required this.store,
  });

  factory StoreResponse.fromJson(Map<String, dynamic> json) => StoreResponse(
        resp: json["resp"],
        msg: json["msg"],
        store: Store.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "store": store.toJson(),
      };
}
