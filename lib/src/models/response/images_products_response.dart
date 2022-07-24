import 'dart:convert';

ImagesProductsResponse imagesProductsResponseFromJson(String str) =>
    ImagesProductsResponse.fromJson(json.decode(str));

String imagesProductsResponseToJson(ImagesProductsResponse data) =>
    json.encode(data.toJson());

class ImagesProductsResponse {
  bool resp;
  String msg;
  List<ImageProductDb> imageProductDb;

  ImagesProductsResponse({
    required this.resp,
    required this.msg,
    required this.imageProductDb,
  });

  factory ImagesProductsResponse.fromJson(Map<String, dynamic> json) =>
      ImagesProductsResponse(
        resp: json["resp"],
        msg: json["msg"],
        imageProductDb: List<ImageProductDb>.from(json['data']["imageProductDb"]
            .map((x) => ImageProductDb.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "imageProductDb":
            List<dynamic>.from(imageProductDb.map((x) => x.toJson())),
      };
}

class ImageProductDb {
  int id;
  String picture;
  int productId;

  ImageProductDb({
    required this.id,
    required this.picture,
    required this.productId,
  });

  factory ImageProductDb.fromJson(Map<String, dynamic> json) => ImageProductDb(
        id: json["id"],
        picture: json["picture"],
        productId: json["product_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
        "product_id": productId,
      };
}
