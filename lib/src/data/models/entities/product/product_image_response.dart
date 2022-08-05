import 'dart:convert';

import 'product_image.dart';

ImagesProductsResponse imagesProductsResponseFromJson(String str) =>
    ImagesProductsResponse.fromJson(json.decode(str));

String imagesProductsResponseToJson(ImagesProductsResponse data) =>
    json.encode(data.toJson());

class ImagesProductsResponse {
  List<ProductImage> images;

  ImagesProductsResponse({
    required this.images,
  });

  factory ImagesProductsResponse.fromJson(Map<String, dynamic> json) =>
      ImagesProductsResponse(
        images: List<ProductImage>.from(
            json['data']["images"].map((x) => ProductImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}
