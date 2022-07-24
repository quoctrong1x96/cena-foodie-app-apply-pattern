import 'dart:convert';

import 'package:cenafoodie/models/store/store_model.dart';

StoresListResponse storeListResponseFromJson(String str) =>
    StoresListResponse.fromJson(json.decode(str));

String storeListResponseToJson(StoresListResponse data) =>
    json.encode(data.toJson());

class StoresListResponse {
  bool resp;
  String msg;
  List<Store> stores;

  StoresListResponse({
    required this.resp,
    required this.msg,
    required this.stores,
  });

  factory StoresListResponse.fromJson(Map<String, dynamic> json) =>
      StoresListResponse(
        resp: json["resp"],
        msg: json["msg"],
        stores: List<Store>.from(json["stores"].map((x) => Store.fromJson(x)))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
      };
}
