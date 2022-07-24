import 'dart:convert';

CategoryAllResponse categoryAllResponseFromJson(String str) =>
    CategoryAllResponse.fromJson(json.decode(str));

String categoryAllResponseToJson(CategoryAllResponse data) =>
    json.encode(data.toJson());

class CategoryAllResponse {
  bool resp;
  String msg;
  List<Category> categories;

  CategoryAllResponse({
    required this.resp,
    required this.msg,
    required this.categories,
  });

  factory CategoryAllResponse.fromJson(Map<String, dynamic> json) =>
      CategoryAllResponse(
        resp: json["resp"],
        msg: json["msg"],
        categories: json["categories"]
            ? List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "resp": resp,
        "msg": msg,
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
      };
}

class Category {
  int id;
  String category;
  String description;
  int storeId;

  Category(
      {required this.id,
      required this.category,
      required this.description,
      required this.storeId});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        category: json["category"],
        description: json["description"],
        storeId: json["store_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "description": description,
        "store_id": storeId,
      };
}
