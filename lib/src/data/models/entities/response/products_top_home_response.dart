import 'dart:convert';

import '../product/product.dart';

ProductsTopHomeResponse productsTopHomeResponseFromJson(String str) =>
    ProductsTopHomeResponse.fromJson(json.decode(str));

String productsTopHomeResponseToJson(ProductsTopHomeResponse data) =>
    json.encode(data.toJson());

class ProductsTopHomeResponse {
  bool resp;
  String msg;
  List<Product> productsDb;

  ProductsTopHomeResponse({
    required this.resp,
    required this.msg,
    required this.productsDb,
  });

  factory ProductsTopHomeResponse.fromJson(Map<String, dynamic> json) =>
      ProductsTopHomeResponse(
        resp: json["resp"],
        msg: json["msg"],
        productsDb:
            List<Product>.from(json['data'].map((x) => Product.fromJson(x)))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "productsDb": List<dynamic>.from(productsDb.map((x) => x.toJson())),
      };
}
