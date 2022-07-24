class StoreImage {
  int id;
  String picture;
  int storeId;

  StoreImage({
    required this.id,
    required this.picture,
    required this.storeId,
  });

  factory StoreImage.fromJson(Map<String, dynamic> json) => StoreImage(
        id: json["id"],
        picture: json["picture"],
        storeId: json["store_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "picture": picture,
        "store_id": storeId,
      };
}
