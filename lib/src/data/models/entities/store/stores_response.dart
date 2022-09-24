import 'dart:convert';

import 'store.dart';

StoresResponse storesResponseFromJson(String str) =>
    StoresResponse.fromJson(json.decode(str));

String storesResponseToJson(StoresResponse data) => json.encode(data.toJson());

class StoresResponse {
  List<Store> stores;

  StoresResponse({
    required this.stores,
  });

  factory StoresResponse.fromJson(Map<String, dynamic> json) => StoresResponse(
        stores: List<Store>.from(json['stores'].map((x) => Store.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "stores": List<dynamic>.from(stores.map((x) => x.toJson())),
      };
}
