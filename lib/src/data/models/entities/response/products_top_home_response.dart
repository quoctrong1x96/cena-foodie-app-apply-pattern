import 'dart:convert';

ProductsTopHomeResponse productsTopHomeResponseFromJson(String str) =>
    ProductsTopHomeResponse.fromJson(json.decode(str));

String productsTopHomeResponseToJson(ProductsTopHomeResponse data) =>
    json.encode(data.toJson());

class ProductsTopHomeResponse {
  bool resp;
  String msg;
  List<FoodAndDrink> productsDb;

  ProductsTopHomeResponse({
    required this.resp,
    required this.msg,
    required this.productsDb,
  });

  factory ProductsTopHomeResponse.fromJson(Map<String, dynamic> json) =>
      ProductsTopHomeResponse(
        resp: json["resp"],
        msg: json["msg"],
        productsDb: List<FoodAndDrink>.from(
            json['data'].map((x) => FoodAndDrink.fromJson(x))).toList(),
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "productsDb": List<dynamic>.from(productsDb.map((x) => x.toJson())),
      };
}

class FoodAndDrink {
  int id;
  String nameProduct;
  String description;
  double price;
  int status;
  String picture;
  String category;
  int categoryId;
  int storeId;
  int liked;
  int viewer;
  int sales;
  int totalSales;

  FoodAndDrink(
      {required this.id,
      required this.nameProduct,
      required this.description,
      required this.price,
      required this.status,
      required this.picture,
      required this.category,
      required this.categoryId,
      this.liked = 0,
      this.sales = 0,
      this.totalSales = 0,
      this.viewer = 9,
      required this.storeId});

  factory FoodAndDrink.fromJson(Map<String, dynamic> json) => FoodAndDrink(
      id: json["id"],
      nameProduct: json["nameProduct"],
      description: json["description"],
      price: json["price"].toDouble(),
      status: json["status"],
      picture: json["picture"],
      category: json["category"],
      categoryId: json["category_id"],
      liked: json["liked"] ?? 0,
      viewer: json["viewer"] ?? 0,
      sales: json["quantity"] ?? 0,
      totalSales: json["amount"] ?? 0,
      storeId: json["store_id"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "nameProduct": nameProduct,
        "description": description,
        "price": price,
        "status": status,
        "picture": picture,
        "category": category,
        "category_id": categoryId,
        "liked": liked,
        "viewer": viewer,
        "quantity": sales,
        "amount": totalSales,
        "store_id": storeId
      };
}
